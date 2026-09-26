# Parse benchmark, short. Three modules, the rest is bulk.

terraform {
  required_version = ">= 1.5.0"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "region" {
  description = "Region everything is created in."
  type        = string
  default     = "us-east-1"
}

locals {
  prefix = "${var.environment}-parse"

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"
}

resource "aws_cloudwatch_log_group" "service_1" {
  name              = "/${local.prefix}/service-1"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_1" {
  name        = "/${local.prefix}/service-1/endpoint"
  description = "Endpoint for service 1."
  type        = "String"
  value       = "https://service-1.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_2" {
  name              = "/${local.prefix}/service-2"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_2" {
  name        = "/${local.prefix}/service-2/endpoint"
  description = "Endpoint for service 2."
  type        = "String"
  value       = "https://service-2.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_3" {
  name              = "/${local.prefix}/service-3"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_3" {
  name        = "/${local.prefix}/service-3/endpoint"
  description = "Endpoint for service 3."
  type        = "String"
  value       = "https://service-3.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_4" {
  name              = "/${local.prefix}/service-4"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_4" {
  name        = "/${local.prefix}/service-4/endpoint"
  description = "Endpoint for service 4."
  type        = "String"
  value       = "https://service-4.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_5" {
  name              = "/${local.prefix}/service-5"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_5" {
  name        = "/${local.prefix}/service-5/endpoint"
  description = "Endpoint for service 5."
  type        = "String"
  value       = "https://service-5.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_6" {
  name              = "/${local.prefix}/service-6"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_6" {
  name        = "/${local.prefix}/service-6/endpoint"
  description = "Endpoint for service 6."
  type        = "String"
  value       = "https://service-6.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_7" {
  name              = "/${local.prefix}/service-7"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_7" {
  name        = "/${local.prefix}/service-7/endpoint"
  description = "Endpoint for service 7."
  type        = "String"
  value       = "https://service-7.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_8" {
  name              = "/${local.prefix}/service-8"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_8" {
  name        = "/${local.prefix}/service-8/endpoint"
  description = "Endpoint for service 8."
  type        = "String"
  value       = "https://service-8.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_9" {
  name              = "/${local.prefix}/service-9"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_9" {
  name        = "/${local.prefix}/service-9/endpoint"
  description = "Endpoint for service 9."
  type        = "String"
  value       = "https://service-9.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_10" {
  name              = "/${local.prefix}/service-10"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_10" {
  name        = "/${local.prefix}/service-10/endpoint"
  description = "Endpoint for service 10."
  type        = "String"
  value       = "https://service-10.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_11" {
  name              = "/${local.prefix}/service-11"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_11" {
  name        = "/${local.prefix}/service-11/endpoint"
  description = "Endpoint for service 11."
  type        = "String"
  value       = "https://service-11.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_12" {
  name              = "/${local.prefix}/service-12"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_12" {
  name        = "/${local.prefix}/service-12/endpoint"
  description = "Endpoint for service 12."
  type        = "String"
  value       = "https://service-12.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_13" {
  name              = "/${local.prefix}/service-13"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_13" {
  name        = "/${local.prefix}/service-13/endpoint"
  description = "Endpoint for service 13."
  type        = "String"
  value       = "https://service-13.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_14" {
  name              = "/${local.prefix}/service-14"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_14" {
  name        = "/${local.prefix}/service-14/endpoint"
  description = "Endpoint for service 14."
  type        = "String"
  value       = "https://service-14.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_15" {
  name              = "/${local.prefix}/service-15"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_15" {
  name        = "/${local.prefix}/service-15/endpoint"
  description = "Endpoint for service 15."
  type        = "String"
  value       = "https://service-15.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_16" {
  name              = "/${local.prefix}/service-16"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_16" {
  name        = "/${local.prefix}/service-16/endpoint"
  description = "Endpoint for service 16."
  type        = "String"
  value       = "https://service-16.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_17" {
  name              = "/${local.prefix}/service-17"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_17" {
  name        = "/${local.prefix}/service-17/endpoint"
  description = "Endpoint for service 17."
  type        = "String"
  value       = "https://service-17.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_18" {
  name              = "/${local.prefix}/service-18"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_18" {
  name        = "/${local.prefix}/service-18/endpoint"
  description = "Endpoint for service 18."
  type        = "String"
  value       = "https://service-18.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_19" {
  name              = "/${local.prefix}/service-19"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_19" {
  name        = "/${local.prefix}/service-19/endpoint"
  description = "Endpoint for service 19."
  type        = "String"
  value       = "https://service-19.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_20" {
  name              = "/${local.prefix}/service-20"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_20" {
  name        = "/${local.prefix}/service-20/endpoint"
  description = "Endpoint for service 20."
  type        = "String"
  value       = "https://service-20.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_21" {
  name              = "/${local.prefix}/service-21"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_21" {
  name        = "/${local.prefix}/service-21/endpoint"
  description = "Endpoint for service 21."
  type        = "String"
  value       = "https://service-21.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_22" {
  name              = "/${local.prefix}/service-22"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_22" {
  name        = "/${local.prefix}/service-22/endpoint"
  description = "Endpoint for service 22."
  type        = "String"
  value       = "https://service-22.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_23" {
  name              = "/${local.prefix}/service-23"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_23" {
  name        = "/${local.prefix}/service-23/endpoint"
  description = "Endpoint for service 23."
  type        = "String"
  value       = "https://service-23.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_24" {
  name              = "/${local.prefix}/service-24"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_24" {
  name        = "/${local.prefix}/service-24/endpoint"
  description = "Endpoint for service 24."
  type        = "String"
  value       = "https://service-24.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_25" {
  name              = "/${local.prefix}/service-25"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_25" {
  name        = "/${local.prefix}/service-25/endpoint"
  description = "Endpoint for service 25."
  type        = "String"
  value       = "https://service-25.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_26" {
  name              = "/${local.prefix}/service-26"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_26" {
  name        = "/${local.prefix}/service-26/endpoint"
  description = "Endpoint for service 26."
  type        = "String"
  value       = "https://service-26.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_27" {
  name              = "/${local.prefix}/service-27"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_27" {
  name        = "/${local.prefix}/service-27/endpoint"
  description = "Endpoint for service 27."
  type        = "String"
  value       = "https://service-27.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_28" {
  name              = "/${local.prefix}/service-28"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_28" {
  name        = "/${local.prefix}/service-28/endpoint"
  description = "Endpoint for service 28."
  type        = "String"
  value       = "https://service-28.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_29" {
  name              = "/${local.prefix}/service-29"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_29" {
  name        = "/${local.prefix}/service-29/endpoint"
  description = "Endpoint for service 29."
  type        = "String"
  value       = "https://service-29.internal"

  tags = local.tags
}
