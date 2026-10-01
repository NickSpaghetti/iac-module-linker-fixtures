# Forty registry modules, four times small.tf. Each one is a round trip.

terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source  = "${local.terraform_aws_modules}/vpc/aws"
  version = var.vpc_version
}

module "rds" {
  source  = "${local.terraform_aws_modules}/rds/aws"
  version = var.rds_version
}

module "security_group" {
  source  = "${local.terraform_aws_modules}/security-group/aws"
  version = var.security_group_version
}

module "eks" {
  source  = "${local.terraform_aws_modules}/eks/aws"
  version = var.eks_version
}

module "s3_bucket" {
  source  = "${local.terraform_aws_modules}/s3-bucket/aws"
  version = var.s3_bucket_version
}

module "alb" {
  source  = "${local.terraform_aws_modules}/alb/aws"
  version = var.alb_version
}

module "iam" {
  source  = "${local.terraform_aws_modules}/iam/aws"
  version = var.iam_version
}

module "lambda" {
  source  = "${local.terraform_aws_modules}/lambda/aws"
  version = var.lambda_version
}

module "ecs" {
  source  = "${local.terraform_aws_modules}/ecs/aws"
  version = var.ecs_version
}

module "acm" {
  source  = "${local.terraform_aws_modules}/acm/aws"
  version = var.acm_version
}

module "autoscaling" {
  source  = "${local.terraform_aws_modules}/autoscaling/aws"
  version = var.autoscaling_version
}

module "cloudfront" {
  source  = "${local.terraform_aws_modules}/cloudfront/aws"
  version = var.cloudfront_version
}

module "dynamodb_table" {
  source  = "${local.terraform_aws_modules}/dynamodb-table/aws"
  version = var.dynamodb_table_version
}

module "efs" {
  source  = "${local.terraform_aws_modules}/efs/aws"
  version = var.efs_version
}

module "key_pair" {
  source  = "${local.terraform_aws_modules}/key-pair/aws"
  version = var.key_pair_version
}

module "kms" {
  source  = "${local.terraform_aws_modules}/kms/aws"
  version = var.kms_version
}

module "rds_aurora" {
  source  = "${local.terraform_aws_modules}/rds-aurora/aws"
  version = var.rds_aurora_version
}

module "redshift" {
  source  = "${local.terraform_aws_modules}/redshift/aws"
  version = var.redshift_version
}

module "route53" {
  source  = "${local.terraform_aws_modules}/route53/aws"
  version = var.route53_version
}

module "sns" {
  source  = "${local.terraform_aws_modules}/sns/aws"
  version = var.sns_version
}

module "sqs" {
  source  = "${local.terraform_aws_modules}/sqs/aws"
  version = var.sqs_version
}

module "step_functions" {
  source  = "${local.terraform_aws_modules}/step-functions/aws"
  version = var.step_functions_version
}

module "transit_gateway" {
  source  = "${local.terraform_aws_modules}/transit-gateway/aws"
  version = var.transit_gateway_version
}

module "cloudwatch" {
  source  = "${local.terraform_aws_modules}/cloudwatch/aws"
  version = var.cloudwatch_version
}

module "apigateway_v2" {
  source  = "${local.terraform_aws_modules}/apigateway-v2/aws"
  version = var.apigateway_v2_version
}

module "appconfig" {
  source  = "${local.terraform_aws_modules}/appconfig/aws"
  version = var.appconfig_version
}

module "atlantis" {
  source  = "${local.terraform_aws_modules}/atlantis/aws"
  version = var.atlantis_version
}

module "customer_gateway" {
  source  = "${local.terraform_aws_modules}/customer-gateway/aws"
  version = var.customer_gateway_version
}

module "ebs_optimized" {
  source  = "${local.terraform_aws_modules}/ebs-optimized/aws"
  version = var.ebs_optimized_version
}

module "ec2_instance" {
  source  = "${local.terraform_aws_modules}/ec2-instance/aws"
  version = var.ec2_instance_version
}

module "eventbridge" {
  source  = "${local.terraform_aws_modules}/eventbridge/aws"
  version = var.eventbridge_version
}

module "global_accelerator" {
  source  = "${local.terraform_aws_modules}/global-accelerator/aws"
  version = var.global_accelerator_version
}

module "managed_service_prometheus" {
  source  = "${local.terraform_aws_modules}/managed-service-prometheus/aws"
  version = var.managed_service_prometheus_version
}

module "memory_db" {
  source  = "${local.terraform_aws_modules}/memory-db/aws"
  version = var.memory_db_version
}

module "notify_slack" {
  source  = "${local.terraform_aws_modules}/notify-slack/aws"
  version = var.notify_slack_version
}

module "opensearch" {
  source  = "${local.terraform_aws_modules}/opensearch/aws"
  version = var.opensearch_version
}

module "pricing" {
  source  = "${local.terraform_aws_modules}/pricing/aws"
  version = var.pricing_version
}

module "rds_proxy" {
  source  = "${local.terraform_aws_modules}/rds-proxy/aws"
  version = var.rds_proxy_version
}

module "secrets_manager" {
  source  = "${local.terraform_aws_modules}/secrets-manager/aws"
  version = var.secrets_manager_version
}

module "ssm_parameter" {
  source  = "${local.terraform_aws_modules}/ssm-parameter/aws"
  version = var.ssm_parameter_version
}

# OpenTofu twin of the .tf file: each version is a variable default and each
# registry namespace a local, so every source and version is evaluated. They
# come last so every module sits on the same line as in the .tf file.

variable "vpc_version" {
  default = ">= 1.0"
}

variable "rds_version" {
  default = "~> 4.1"
}

variable "security_group_version" {
  default = ">= 2.0, < 100.0"
}

variable "eks_version" {
  default = "~> 5.0"
}

variable "s3_bucket_version" {
  default = ">= 1.0"
}

variable "alb_version" {
  default = "~> 4.1"
}

variable "iam_version" {
  default = ">= 2.0, < 100.0"
}

variable "lambda_version" {
  default = "~> 5.0"
}

variable "ecs_version" {
  default = ">= 1.0"
}

variable "acm_version" {
  default = "~> 4.1"
}

variable "autoscaling_version" {
  default = ">= 2.0, < 100.0"
}

variable "cloudfront_version" {
  default = "~> 5.0"
}

variable "dynamodb_table_version" {
  default = ">= 1.0"
}

variable "efs_version" {
  default = "~> 4.1"
}

variable "key_pair_version" {
  default = ">= 2.0, < 100.0"
}

variable "kms_version" {
  default = "~> 5.0"
}

variable "rds_aurora_version" {
  default = ">= 1.0"
}

variable "redshift_version" {
  default = "~> 4.1"
}

variable "route53_version" {
  default = ">= 2.0, < 100.0"
}

variable "sns_version" {
  default = "~> 5.0"
}

variable "sqs_version" {
  default = ">= 1.0"
}

variable "step_functions_version" {
  default = "~> 4.1"
}

variable "transit_gateway_version" {
  default = ">= 2.0, < 100.0"
}

variable "cloudwatch_version" {
  default = "~> 5.0"
}

variable "apigateway_v2_version" {
  default = ">= 1.0"
}

variable "appconfig_version" {
  default = "~> 4.1"
}

variable "atlantis_version" {
  default = ">= 2.0, < 100.0"
}

variable "customer_gateway_version" {
  default = "~> 5.0"
}

variable "ebs_optimized_version" {
  default = ">= 1.0"
}

variable "ec2_instance_version" {
  default = "~> 4.1"
}

variable "eventbridge_version" {
  default = ">= 2.0, < 100.0"
}

variable "global_accelerator_version" {
  default = "~> 5.0"
}

variable "managed_service_prometheus_version" {
  default = ">= 1.0"
}

variable "memory_db_version" {
  default = "~> 4.1"
}

variable "notify_slack_version" {
  default = ">= 2.0, < 100.0"
}

variable "opensearch_version" {
  default = "~> 5.0"
}

variable "pricing_version" {
  default = ">= 1.0"
}

variable "rds_proxy_version" {
  default = "~> 4.1"
}

variable "secrets_manager_version" {
  default = ">= 2.0, < 100.0"
}

variable "ssm_parameter_version" {
  default = "~> 5.0"
}

locals {
  terraform_aws_modules = "terraform-aws-modules"
}
