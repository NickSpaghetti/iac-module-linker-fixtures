# Benchmark fixture: a long root module.
#
# GitHub renders about 210 lines at a time, so this file needs several scroll
# pauses to reach the bottom. Module blocks are spread down it deliberately:
# the point is that new modules come into view as the page scrolls, which is
# when the extension re-injects.
#
# Sources are local paths and github shorthand. Neither needs a registry
# lookup, so the counts the harness asserts stay deterministic.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}

variable "environment" {
  description = "Deployment environment, one of dev, staging or prod."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging or prod."
  }
}

variable "region" {
  description = "AWS region everything in this root module is created in."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones to spread subnets across."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "instance_types" {
  description = "Instance type per tier."
  type        = map(string)

  default = {
    web    = "t3.medium"
    worker = "c6i.large"
    batch  = "m6i.xlarge"
  }
}

variable "retention_days" {
  description = "How long to keep logs, per environment."
  type        = map(number)

  default = {
    dev     = 7
    staging = 30
    prod    = 365
  }
}

locals {
  name_prefix = "${var.environment}-platform"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Repository  = "iac-module-linker-fixtures"
  }

  subnet_bits = 4

  public_subnets = [
    for index, zone in var.availability_zones :
    cidrsubnet(var.vpc_cidr, local.subnet_bits, index)
  ]

  private_subnets = [
    for index, zone in var.availability_zones :
    cidrsubnet(var.vpc_cidr, local.subnet_bits, index + length(var.availability_zones))
  ]

  log_retention = lookup(var.retention_days, var.environment, 7)
}

module "network" {
  source = "./modules/network"

  name_prefix        = local.name_prefix
  cidr_block         = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = local.public_subnets
  private_subnets    = local.private_subnets
  tags               = local.common_tags
}

resource "aws_flow_log" "vpc" {
  vpc_id               = module.network.vpc_id
  traffic_type         = "ALL"
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.flow.arn
  iam_role_arn         = aws_iam_role.flow_log.arn

  tags = local.common_tags
}

resource "aws_cloudwatch_log_group" "flow" {
  name              = "/${local.name_prefix}/vpc/flow"
  retention_in_days = local.log_retention

  tags = local.common_tags
}

resource "aws_iam_role" "flow_log" {
  name = "${local.name_prefix}-flow-log"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy" "flow_log" {
  name = "${local.name_prefix}-flow-log"
  role = aws_iam_role.flow_log.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      }
    ]
  })
}

module "security_groups" {
  source = "./modules/security-groups"

  name_prefix = local.name_prefix
  vpc_id      = module.network.vpc_id
  vpc_cidr    = var.vpc_cidr
  tags        = local.common_tags
}

resource "aws_security_group_rule" "web_egress" {
  type              = "egress"
  security_group_id = module.security_groups.web_id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic from the web tier."
}

resource "aws_security_group_rule" "worker_from_web" {
  type                     = "ingress"
  security_group_id        = module.security_groups.worker_id
  source_security_group_id = module.security_groups.web_id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  description              = "Workers accept traffic from the web tier only."
}

module "kms" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures//modules/vpc"

  name_prefix = local.name_prefix
  tags        = local.common_tags
}

resource "aws_kms_alias" "primary" {
  name          = "alias/${local.name_prefix}-primary"
  target_key_id = module.kms.key_id
}

resource "random_password" "database" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "database" {
  name        = "${local.name_prefix}/database/master"
  description = "Master credentials for the platform database."
  kms_key_id  = module.kms.key_id

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "database" {
  secret_id = aws_secretsmanager_secret.database.id

  secret_string = jsonencode({
    username = "platform"
    password = random_password.database.result
  })
}

module "database" {
  source = "./modules/database"

  name_prefix        = local.name_prefix
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security_groups.database_id]
  kms_key_id         = module.kms.key_id
  secret_arn         = aws_secretsmanager_secret.database.arn
  retention_days     = local.log_retention
  tags               = local.common_tags
}

resource "aws_db_parameter_group" "platform" {
  name   = "${local.name_prefix}-postgres"
  family = "postgres16"

  parameter {
    name  = "log_min_duration_statement"
    value = "250"
  }

  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
  }

  parameter {
    name  = "work_mem"
    value = "8192"
  }

  tags = local.common_tags
}

resource "aws_cloudwatch_log_group" "database" {
  name              = "/${local.name_prefix}/database/postgresql"
  retention_in_days = local.log_retention

  tags = local.common_tags
}

module "cache" {
  source = "./modules/cache"

  name_prefix        = local.name_prefix
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security_groups.cache_id]
  node_type          = var.environment == "prod" ? "cache.r6g.large" : "cache.t4g.micro"
  tags               = local.common_tags
}

resource "aws_elasticache_parameter_group" "platform" {
  name   = "${local.name_prefix}-redis"
  family = "redis7"

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }

  tags = local.common_tags
}

resource "aws_s3_bucket" "artifacts" {
  bucket = "${local.name_prefix}-artifacts"

  tags = local.common_tags
}

resource "aws_s3_bucket_versioning" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = module.kms.key_id
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = local.log_retention
    }
  }
}

module "artifact_access" {
  source = "./modules/iam-policy"

  name_prefix = local.name_prefix
  bucket_arn  = aws_s3_bucket.artifacts.arn
  kms_key_arn = module.kms.key_arn
  tags        = local.common_tags
}

resource "aws_launch_template" "web" {
  name_prefix   = "${local.name_prefix}-web-"
  image_id      = data.aws_ami.base.id
  instance_type = var.instance_types["web"]

  vpc_security_group_ids = [module.security_groups.web_id]

  iam_instance_profile {
    arn = module.artifact_access.instance_profile_arn
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 40
      volume_type = "gp3"
      encrypted   = true
      kms_key_id  = module.kms.key_arn
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tag_specifications {
    resource_type = "instance"
    tags          = merge(local.common_tags, { Tier = "web" })
  }
}

data "aws_ami" "base" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "web_tier" {
  source = "./modules/autoscaling"

  name_prefix         = "${local.name_prefix}-web"
  launch_template_id  = aws_launch_template.web.id
  subnet_ids          = module.network.public_subnet_ids
  min_size            = var.environment == "prod" ? 3 : 1
  max_size            = var.environment == "prod" ? 12 : 3
  target_group_arns   = [module.load_balancer.target_group_arn]
  health_check_type   = "ELB"
  tags                = local.common_tags
}

module "load_balancer" {
  source = "./modules/alb"

  name_prefix        = local.name_prefix
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [module.security_groups.alb_id]
  certificate_arn    = module.certificates.arn
  access_logs_bucket = aws_s3_bucket.artifacts.id
  tags               = local.common_tags
}

module "certificates" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures//modules/lambda"

  name_prefix = local.name_prefix
  domain_name = "${var.environment}.example.com"
  tags        = local.common_tags
}

resource "aws_route53_record" "web" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.environment}.example.com"
  type    = "A"

  alias {
    name                   = module.load_balancer.dns_name
    zone_id                = module.load_balancer.zone_id
    evaluate_target_health = true
  }
}

data "aws_route53_zone" "primary" {
  name         = "example.com"
  private_zone = false
}

resource "aws_launch_template" "worker" {
  name_prefix   = "${local.name_prefix}-worker-"
  image_id      = data.aws_ami.base.id
  instance_type = var.instance_types["worker"]

  vpc_security_group_ids = [module.security_groups.worker_id]

  iam_instance_profile {
    arn = module.artifact_access.instance_profile_arn
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 100
      volume_type = "gp3"
      encrypted   = true
      kms_key_id  = module.kms.key_arn
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = merge(local.common_tags, { Tier = "worker" })
  }
}

module "worker_tier" {
  source = "./modules/autoscaling"

  name_prefix        = "${local.name_prefix}-worker"
  launch_template_id = aws_launch_template.worker.id
  subnet_ids         = module.network.private_subnet_ids
  min_size           = var.environment == "prod" ? 2 : 1
  max_size           = var.environment == "prod" ? 24 : 4
  target_group_arns  = []
  health_check_type  = "EC2"
  tags               = local.common_tags
}

resource "aws_sqs_queue" "batch_dead_letter" {
  name                      = "${local.name_prefix}-batch-dlq"
  message_retention_seconds = 1209600
  kms_master_key_id         = module.kms.key_id

  tags = local.common_tags
}

resource "aws_sqs_queue" "batch" {
  name                       = "${local.name_prefix}-batch"
  visibility_timeout_seconds = 300
  kms_master_key_id          = module.kms.key_id

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.batch_dead_letter.arn
    maxReceiveCount     = 5
  })

  tags = local.common_tags
}

module "batch_workers" {
  source = "./modules/batch"

  name_prefix        = local.name_prefix
  queue_arn          = aws_sqs_queue.batch.arn
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.security_groups.worker_id]
  instance_type      = var.instance_types["batch"]
  tags               = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "queue_depth" {
  alarm_name          = "${local.name_prefix}-batch-backlog"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = 300
  statistic           = "Average"
  threshold           = 1000
  alarm_description   = "Batch queue is backing up faster than it drains."
  alarm_actions       = [module.alerting.topic_arn]

  dimensions = {
    QueueName = aws_sqs_queue.batch.name
  }

  tags = local.common_tags
}

module "alerting" {
  source = "./modules/sns-alerting"

  name_prefix = local.name_prefix
  kms_key_id  = module.kms.key_id
  tags        = local.common_tags
}

resource "aws_cloudwatch_metric_alarm" "database_cpu" {
  alarm_name          = "${local.name_prefix}-database-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Database CPU sustained above eighty percent."
  alarm_actions       = [module.alerting.topic_arn]

  dimensions = {
    DBInstanceIdentifier = module.database.instance_id
  }

  tags = local.common_tags
}

module "observability" {
  source = "./modules/observability"

  name_prefix    = local.name_prefix
  log_groups     = [aws_cloudwatch_log_group.flow.name, aws_cloudwatch_log_group.database.name]
  retention_days = local.log_retention
  topic_arn      = module.alerting.topic_arn
  tags           = local.common_tags
}

module "backups" {
  source = "./modules/backup"

  name_prefix     = local.name_prefix
  database_arn    = module.database.instance_arn
  bucket_arn      = aws_s3_bucket.artifacts.arn
  kms_key_arn     = module.kms.key_arn
  retention_days  = local.log_retention
  tags            = local.common_tags
}

output "vpc_id" {
  description = "Identifier of the VPC everything is created in."
  value       = module.network.vpc_id
}

output "load_balancer_dns" {
  description = "Public DNS name of the application load balancer."
  value       = module.load_balancer.dns_name
}

output "database_endpoint" {
  description = "Connection endpoint for the platform database."
  value       = module.database.endpoint
  sensitive   = true
}

output "artifact_bucket" {
  description = "Bucket holding build artifacts and access logs."
  value       = aws_s3_bucket.artifacts.id
}

output "alert_topic_arn" {
  description = "SNS topic every alarm publishes to."
  value       = module.alerting.topic_arn
}
