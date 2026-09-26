# Forty registry modules, four times small.tf. Each one is a round trip.

terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">= 1.0"
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 4.1"
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = ">= 2.0, < 100.0"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 5.0"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = ">= 1.0"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 4.1"
}

module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = ">= 2.0, < 100.0"
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 5.0"
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = ">= 1.0"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.1"
}

module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = ">= 2.0, < 100.0"
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~> 5.0"
}

module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = ">= 1.0"
}

module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "~> 4.1"
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = ">= 2.0, < 100.0"
}

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 5.0"
}

module "rds_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = ">= 1.0"
}

module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "~> 4.1"
}

module "route53" {
  source  = "terraform-aws-modules/route53/aws"
  version = ">= 2.0, < 100.0"
}

module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 5.0"
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = ">= 1.0"
}

module "step_functions" {
  source  = "terraform-aws-modules/step-functions/aws"
  version = "~> 4.1"
}

module "transit_gateway" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = ">= 2.0, < 100.0"
}

module "cloudwatch" {
  source  = "terraform-aws-modules/cloudwatch/aws"
  version = "~> 5.0"
}

module "apigateway_v2" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = ">= 1.0"
}

module "appconfig" {
  source  = "terraform-aws-modules/appconfig/aws"
  version = "~> 4.1"
}

module "atlantis" {
  source  = "terraform-aws-modules/atlantis/aws"
  version = ">= 2.0, < 100.0"
}

module "customer_gateway" {
  source  = "terraform-aws-modules/customer-gateway/aws"
  version = "~> 5.0"
}

module "ebs_optimized" {
  source  = "terraform-aws-modules/ebs-optimized/aws"
  version = ">= 1.0"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.1"
}

module "eventbridge" {
  source  = "terraform-aws-modules/eventbridge/aws"
  version = ">= 2.0, < 100.0"
}

module "global_accelerator" {
  source  = "terraform-aws-modules/global-accelerator/aws"
  version = "~> 5.0"
}

module "managed_service_prometheus" {
  source  = "terraform-aws-modules/managed-service-prometheus/aws"
  version = ">= 1.0"
}

module "memory_db" {
  source  = "terraform-aws-modules/memory-db/aws"
  version = "~> 4.1"
}

module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = ">= 2.0, < 100.0"
}

module "opensearch" {
  source  = "terraform-aws-modules/opensearch/aws"
  version = "~> 5.0"
}

module "pricing" {
  source  = "terraform-aws-modules/pricing/aws"
  version = ">= 1.0"
}

module "rds_proxy" {
  source  = "terraform-aws-modules/rds-proxy/aws"
  version = "~> 4.1"
}

module "secrets_manager" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = ">= 2.0, < 100.0"
}

module "ssm_parameter" {
  source  = "terraform-aws-modules/ssm-parameter/aws"
  version = "~> 5.0"
}
