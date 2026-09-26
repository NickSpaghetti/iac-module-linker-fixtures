# Parse benchmark, long. Three modules, the rest is bulk.

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

resource "aws_cloudwatch_log_group" "service_30" {
  name              = "/${local.prefix}/service-30"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_30" {
  name        = "/${local.prefix}/service-30/endpoint"
  description = "Endpoint for service 30."
  type        = "String"
  value       = "https://service-30.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_31" {
  name              = "/${local.prefix}/service-31"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_31" {
  name        = "/${local.prefix}/service-31/endpoint"
  description = "Endpoint for service 31."
  type        = "String"
  value       = "https://service-31.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_32" {
  name              = "/${local.prefix}/service-32"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_32" {
  name        = "/${local.prefix}/service-32/endpoint"
  description = "Endpoint for service 32."
  type        = "String"
  value       = "https://service-32.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_33" {
  name              = "/${local.prefix}/service-33"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_33" {
  name        = "/${local.prefix}/service-33/endpoint"
  description = "Endpoint for service 33."
  type        = "String"
  value       = "https://service-33.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_34" {
  name              = "/${local.prefix}/service-34"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_34" {
  name        = "/${local.prefix}/service-34/endpoint"
  description = "Endpoint for service 34."
  type        = "String"
  value       = "https://service-34.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_35" {
  name              = "/${local.prefix}/service-35"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_35" {
  name        = "/${local.prefix}/service-35/endpoint"
  description = "Endpoint for service 35."
  type        = "String"
  value       = "https://service-35.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_36" {
  name              = "/${local.prefix}/service-36"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_36" {
  name        = "/${local.prefix}/service-36/endpoint"
  description = "Endpoint for service 36."
  type        = "String"
  value       = "https://service-36.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_37" {
  name              = "/${local.prefix}/service-37"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_37" {
  name        = "/${local.prefix}/service-37/endpoint"
  description = "Endpoint for service 37."
  type        = "String"
  value       = "https://service-37.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_38" {
  name              = "/${local.prefix}/service-38"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_38" {
  name        = "/${local.prefix}/service-38/endpoint"
  description = "Endpoint for service 38."
  type        = "String"
  value       = "https://service-38.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_39" {
  name              = "/${local.prefix}/service-39"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_39" {
  name        = "/${local.prefix}/service-39/endpoint"
  description = "Endpoint for service 39."
  type        = "String"
  value       = "https://service-39.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_40" {
  name              = "/${local.prefix}/service-40"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_40" {
  name        = "/${local.prefix}/service-40/endpoint"
  description = "Endpoint for service 40."
  type        = "String"
  value       = "https://service-40.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_41" {
  name              = "/${local.prefix}/service-41"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_41" {
  name        = "/${local.prefix}/service-41/endpoint"
  description = "Endpoint for service 41."
  type        = "String"
  value       = "https://service-41.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_42" {
  name              = "/${local.prefix}/service-42"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_42" {
  name        = "/${local.prefix}/service-42/endpoint"
  description = "Endpoint for service 42."
  type        = "String"
  value       = "https://service-42.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_43" {
  name              = "/${local.prefix}/service-43"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_43" {
  name        = "/${local.prefix}/service-43/endpoint"
  description = "Endpoint for service 43."
  type        = "String"
  value       = "https://service-43.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_44" {
  name              = "/${local.prefix}/service-44"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_44" {
  name        = "/${local.prefix}/service-44/endpoint"
  description = "Endpoint for service 44."
  type        = "String"
  value       = "https://service-44.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_45" {
  name              = "/${local.prefix}/service-45"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_45" {
  name        = "/${local.prefix}/service-45/endpoint"
  description = "Endpoint for service 45."
  type        = "String"
  value       = "https://service-45.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_46" {
  name              = "/${local.prefix}/service-46"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_46" {
  name        = "/${local.prefix}/service-46/endpoint"
  description = "Endpoint for service 46."
  type        = "String"
  value       = "https://service-46.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_47" {
  name              = "/${local.prefix}/service-47"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_47" {
  name        = "/${local.prefix}/service-47/endpoint"
  description = "Endpoint for service 47."
  type        = "String"
  value       = "https://service-47.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_48" {
  name              = "/${local.prefix}/service-48"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_48" {
  name        = "/${local.prefix}/service-48/endpoint"
  description = "Endpoint for service 48."
  type        = "String"
  value       = "https://service-48.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_49" {
  name              = "/${local.prefix}/service-49"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_49" {
  name        = "/${local.prefix}/service-49/endpoint"
  description = "Endpoint for service 49."
  type        = "String"
  value       = "https://service-49.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_50" {
  name              = "/${local.prefix}/service-50"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_50" {
  name        = "/${local.prefix}/service-50/endpoint"
  description = "Endpoint for service 50."
  type        = "String"
  value       = "https://service-50.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_51" {
  name              = "/${local.prefix}/service-51"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_51" {
  name        = "/${local.prefix}/service-51/endpoint"
  description = "Endpoint for service 51."
  type        = "String"
  value       = "https://service-51.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_52" {
  name              = "/${local.prefix}/service-52"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_52" {
  name        = "/${local.prefix}/service-52/endpoint"
  description = "Endpoint for service 52."
  type        = "String"
  value       = "https://service-52.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_53" {
  name              = "/${local.prefix}/service-53"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_53" {
  name        = "/${local.prefix}/service-53/endpoint"
  description = "Endpoint for service 53."
  type        = "String"
  value       = "https://service-53.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_54" {
  name              = "/${local.prefix}/service-54"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_54" {
  name        = "/${local.prefix}/service-54/endpoint"
  description = "Endpoint for service 54."
  type        = "String"
  value       = "https://service-54.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_55" {
  name              = "/${local.prefix}/service-55"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_55" {
  name        = "/${local.prefix}/service-55/endpoint"
  description = "Endpoint for service 55."
  type        = "String"
  value       = "https://service-55.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_56" {
  name              = "/${local.prefix}/service-56"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_56" {
  name        = "/${local.prefix}/service-56/endpoint"
  description = "Endpoint for service 56."
  type        = "String"
  value       = "https://service-56.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_57" {
  name              = "/${local.prefix}/service-57"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_57" {
  name        = "/${local.prefix}/service-57/endpoint"
  description = "Endpoint for service 57."
  type        = "String"
  value       = "https://service-57.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_58" {
  name              = "/${local.prefix}/service-58"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_58" {
  name        = "/${local.prefix}/service-58/endpoint"
  description = "Endpoint for service 58."
  type        = "String"
  value       = "https://service-58.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_59" {
  name              = "/${local.prefix}/service-59"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_59" {
  name        = "/${local.prefix}/service-59/endpoint"
  description = "Endpoint for service 59."
  type        = "String"
  value       = "https://service-59.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_60" {
  name              = "/${local.prefix}/service-60"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_60" {
  name        = "/${local.prefix}/service-60/endpoint"
  description = "Endpoint for service 60."
  type        = "String"
  value       = "https://service-60.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_61" {
  name              = "/${local.prefix}/service-61"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_61" {
  name        = "/${local.prefix}/service-61/endpoint"
  description = "Endpoint for service 61."
  type        = "String"
  value       = "https://service-61.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_62" {
  name              = "/${local.prefix}/service-62"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_62" {
  name        = "/${local.prefix}/service-62/endpoint"
  description = "Endpoint for service 62."
  type        = "String"
  value       = "https://service-62.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_63" {
  name              = "/${local.prefix}/service-63"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_63" {
  name        = "/${local.prefix}/service-63/endpoint"
  description = "Endpoint for service 63."
  type        = "String"
  value       = "https://service-63.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_64" {
  name              = "/${local.prefix}/service-64"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_64" {
  name        = "/${local.prefix}/service-64/endpoint"
  description = "Endpoint for service 64."
  type        = "String"
  value       = "https://service-64.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_65" {
  name              = "/${local.prefix}/service-65"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_65" {
  name        = "/${local.prefix}/service-65/endpoint"
  description = "Endpoint for service 65."
  type        = "String"
  value       = "https://service-65.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_66" {
  name              = "/${local.prefix}/service-66"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_66" {
  name        = "/${local.prefix}/service-66/endpoint"
  description = "Endpoint for service 66."
  type        = "String"
  value       = "https://service-66.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_67" {
  name              = "/${local.prefix}/service-67"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_67" {
  name        = "/${local.prefix}/service-67/endpoint"
  description = "Endpoint for service 67."
  type        = "String"
  value       = "https://service-67.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_68" {
  name              = "/${local.prefix}/service-68"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_68" {
  name        = "/${local.prefix}/service-68/endpoint"
  description = "Endpoint for service 68."
  type        = "String"
  value       = "https://service-68.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_69" {
  name              = "/${local.prefix}/service-69"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_69" {
  name        = "/${local.prefix}/service-69/endpoint"
  description = "Endpoint for service 69."
  type        = "String"
  value       = "https://service-69.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_70" {
  name              = "/${local.prefix}/service-70"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_70" {
  name        = "/${local.prefix}/service-70/endpoint"
  description = "Endpoint for service 70."
  type        = "String"
  value       = "https://service-70.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_71" {
  name              = "/${local.prefix}/service-71"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_71" {
  name        = "/${local.prefix}/service-71/endpoint"
  description = "Endpoint for service 71."
  type        = "String"
  value       = "https://service-71.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_72" {
  name              = "/${local.prefix}/service-72"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_72" {
  name        = "/${local.prefix}/service-72/endpoint"
  description = "Endpoint for service 72."
  type        = "String"
  value       = "https://service-72.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_73" {
  name              = "/${local.prefix}/service-73"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_73" {
  name        = "/${local.prefix}/service-73/endpoint"
  description = "Endpoint for service 73."
  type        = "String"
  value       = "https://service-73.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_74" {
  name              = "/${local.prefix}/service-74"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_74" {
  name        = "/${local.prefix}/service-74/endpoint"
  description = "Endpoint for service 74."
  type        = "String"
  value       = "https://service-74.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_75" {
  name              = "/${local.prefix}/service-75"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_75" {
  name        = "/${local.prefix}/service-75/endpoint"
  description = "Endpoint for service 75."
  type        = "String"
  value       = "https://service-75.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_76" {
  name              = "/${local.prefix}/service-76"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_76" {
  name        = "/${local.prefix}/service-76/endpoint"
  description = "Endpoint for service 76."
  type        = "String"
  value       = "https://service-76.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_77" {
  name              = "/${local.prefix}/service-77"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_77" {
  name        = "/${local.prefix}/service-77/endpoint"
  description = "Endpoint for service 77."
  type        = "String"
  value       = "https://service-77.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_78" {
  name              = "/${local.prefix}/service-78"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_78" {
  name        = "/${local.prefix}/service-78/endpoint"
  description = "Endpoint for service 78."
  type        = "String"
  value       = "https://service-78.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_79" {
  name              = "/${local.prefix}/service-79"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_79" {
  name        = "/${local.prefix}/service-79/endpoint"
  description = "Endpoint for service 79."
  type        = "String"
  value       = "https://service-79.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_80" {
  name              = "/${local.prefix}/service-80"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_80" {
  name        = "/${local.prefix}/service-80/endpoint"
  description = "Endpoint for service 80."
  type        = "String"
  value       = "https://service-80.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_81" {
  name              = "/${local.prefix}/service-81"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_81" {
  name        = "/${local.prefix}/service-81/endpoint"
  description = "Endpoint for service 81."
  type        = "String"
  value       = "https://service-81.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_82" {
  name              = "/${local.prefix}/service-82"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_82" {
  name        = "/${local.prefix}/service-82/endpoint"
  description = "Endpoint for service 82."
  type        = "String"
  value       = "https://service-82.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_83" {
  name              = "/${local.prefix}/service-83"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_83" {
  name        = "/${local.prefix}/service-83/endpoint"
  description = "Endpoint for service 83."
  type        = "String"
  value       = "https://service-83.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_84" {
  name              = "/${local.prefix}/service-84"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_84" {
  name        = "/${local.prefix}/service-84/endpoint"
  description = "Endpoint for service 84."
  type        = "String"
  value       = "https://service-84.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_85" {
  name              = "/${local.prefix}/service-85"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_85" {
  name        = "/${local.prefix}/service-85/endpoint"
  description = "Endpoint for service 85."
  type        = "String"
  value       = "https://service-85.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_86" {
  name              = "/${local.prefix}/service-86"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_86" {
  name        = "/${local.prefix}/service-86/endpoint"
  description = "Endpoint for service 86."
  type        = "String"
  value       = "https://service-86.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_87" {
  name              = "/${local.prefix}/service-87"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_87" {
  name        = "/${local.prefix}/service-87/endpoint"
  description = "Endpoint for service 87."
  type        = "String"
  value       = "https://service-87.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_88" {
  name              = "/${local.prefix}/service-88"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_88" {
  name        = "/${local.prefix}/service-88/endpoint"
  description = "Endpoint for service 88."
  type        = "String"
  value       = "https://service-88.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_89" {
  name              = "/${local.prefix}/service-89"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_89" {
  name        = "/${local.prefix}/service-89/endpoint"
  description = "Endpoint for service 89."
  type        = "String"
  value       = "https://service-89.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_90" {
  name              = "/${local.prefix}/service-90"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_90" {
  name        = "/${local.prefix}/service-90/endpoint"
  description = "Endpoint for service 90."
  type        = "String"
  value       = "https://service-90.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_91" {
  name              = "/${local.prefix}/service-91"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_91" {
  name        = "/${local.prefix}/service-91/endpoint"
  description = "Endpoint for service 91."
  type        = "String"
  value       = "https://service-91.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_92" {
  name              = "/${local.prefix}/service-92"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_92" {
  name        = "/${local.prefix}/service-92/endpoint"
  description = "Endpoint for service 92."
  type        = "String"
  value       = "https://service-92.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_93" {
  name              = "/${local.prefix}/service-93"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_93" {
  name        = "/${local.prefix}/service-93/endpoint"
  description = "Endpoint for service 93."
  type        = "String"
  value       = "https://service-93.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_94" {
  name              = "/${local.prefix}/service-94"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_94" {
  name        = "/${local.prefix}/service-94/endpoint"
  description = "Endpoint for service 94."
  type        = "String"
  value       = "https://service-94.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_95" {
  name              = "/${local.prefix}/service-95"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_95" {
  name        = "/${local.prefix}/service-95/endpoint"
  description = "Endpoint for service 95."
  type        = "String"
  value       = "https://service-95.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_96" {
  name              = "/${local.prefix}/service-96"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_96" {
  name        = "/${local.prefix}/service-96/endpoint"
  description = "Endpoint for service 96."
  type        = "String"
  value       = "https://service-96.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_97" {
  name              = "/${local.prefix}/service-97"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_97" {
  name        = "/${local.prefix}/service-97/endpoint"
  description = "Endpoint for service 97."
  type        = "String"
  value       = "https://service-97.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_98" {
  name              = "/${local.prefix}/service-98"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_98" {
  name        = "/${local.prefix}/service-98/endpoint"
  description = "Endpoint for service 98."
  type        = "String"
  value       = "https://service-98.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_99" {
  name              = "/${local.prefix}/service-99"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_99" {
  name        = "/${local.prefix}/service-99/endpoint"
  description = "Endpoint for service 99."
  type        = "String"
  value       = "https://service-99.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_100" {
  name              = "/${local.prefix}/service-100"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_100" {
  name        = "/${local.prefix}/service-100/endpoint"
  description = "Endpoint for service 100."
  type        = "String"
  value       = "https://service-100.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_101" {
  name              = "/${local.prefix}/service-101"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_101" {
  name        = "/${local.prefix}/service-101/endpoint"
  description = "Endpoint for service 101."
  type        = "String"
  value       = "https://service-101.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_102" {
  name              = "/${local.prefix}/service-102"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_102" {
  name        = "/${local.prefix}/service-102/endpoint"
  description = "Endpoint for service 102."
  type        = "String"
  value       = "https://service-102.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_103" {
  name              = "/${local.prefix}/service-103"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_103" {
  name        = "/${local.prefix}/service-103/endpoint"
  description = "Endpoint for service 103."
  type        = "String"
  value       = "https://service-103.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_104" {
  name              = "/${local.prefix}/service-104"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_104" {
  name        = "/${local.prefix}/service-104/endpoint"
  description = "Endpoint for service 104."
  type        = "String"
  value       = "https://service-104.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_105" {
  name              = "/${local.prefix}/service-105"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_105" {
  name        = "/${local.prefix}/service-105/endpoint"
  description = "Endpoint for service 105."
  type        = "String"
  value       = "https://service-105.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_106" {
  name              = "/${local.prefix}/service-106"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_106" {
  name        = "/${local.prefix}/service-106/endpoint"
  description = "Endpoint for service 106."
  type        = "String"
  value       = "https://service-106.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_107" {
  name              = "/${local.prefix}/service-107"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_107" {
  name        = "/${local.prefix}/service-107/endpoint"
  description = "Endpoint for service 107."
  type        = "String"
  value       = "https://service-107.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_108" {
  name              = "/${local.prefix}/service-108"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_108" {
  name        = "/${local.prefix}/service-108/endpoint"
  description = "Endpoint for service 108."
  type        = "String"
  value       = "https://service-108.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_109" {
  name              = "/${local.prefix}/service-109"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_109" {
  name        = "/${local.prefix}/service-109/endpoint"
  description = "Endpoint for service 109."
  type        = "String"
  value       = "https://service-109.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_110" {
  name              = "/${local.prefix}/service-110"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_110" {
  name        = "/${local.prefix}/service-110/endpoint"
  description = "Endpoint for service 110."
  type        = "String"
  value       = "https://service-110.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_111" {
  name              = "/${local.prefix}/service-111"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_111" {
  name        = "/${local.prefix}/service-111/endpoint"
  description = "Endpoint for service 111."
  type        = "String"
  value       = "https://service-111.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_112" {
  name              = "/${local.prefix}/service-112"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_112" {
  name        = "/${local.prefix}/service-112/endpoint"
  description = "Endpoint for service 112."
  type        = "String"
  value       = "https://service-112.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_113" {
  name              = "/${local.prefix}/service-113"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_113" {
  name        = "/${local.prefix}/service-113/endpoint"
  description = "Endpoint for service 113."
  type        = "String"
  value       = "https://service-113.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_114" {
  name              = "/${local.prefix}/service-114"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_114" {
  name        = "/${local.prefix}/service-114/endpoint"
  description = "Endpoint for service 114."
  type        = "String"
  value       = "https://service-114.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_115" {
  name              = "/${local.prefix}/service-115"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_115" {
  name        = "/${local.prefix}/service-115/endpoint"
  description = "Endpoint for service 115."
  type        = "String"
  value       = "https://service-115.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_116" {
  name              = "/${local.prefix}/service-116"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_116" {
  name        = "/${local.prefix}/service-116/endpoint"
  description = "Endpoint for service 116."
  type        = "String"
  value       = "https://service-116.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_117" {
  name              = "/${local.prefix}/service-117"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_117" {
  name        = "/${local.prefix}/service-117/endpoint"
  description = "Endpoint for service 117."
  type        = "String"
  value       = "https://service-117.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_118" {
  name              = "/${local.prefix}/service-118"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_118" {
  name        = "/${local.prefix}/service-118/endpoint"
  description = "Endpoint for service 118."
  type        = "String"
  value       = "https://service-118.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_119" {
  name              = "/${local.prefix}/service-119"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_119" {
  name        = "/${local.prefix}/service-119/endpoint"
  description = "Endpoint for service 119."
  type        = "String"
  value       = "https://service-119.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_120" {
  name              = "/${local.prefix}/service-120"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_120" {
  name        = "/${local.prefix}/service-120/endpoint"
  description = "Endpoint for service 120."
  type        = "String"
  value       = "https://service-120.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_121" {
  name              = "/${local.prefix}/service-121"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_121" {
  name        = "/${local.prefix}/service-121/endpoint"
  description = "Endpoint for service 121."
  type        = "String"
  value       = "https://service-121.internal"

  tags = local.tags
}

resource "aws_cloudwatch_log_group" "service_122" {
  name              = "/${local.prefix}/service-122"
  retention_in_days = 30

  tags = local.tags
}

resource "aws_ssm_parameter" "service_122" {
  name        = "/${local.prefix}/service-122/endpoint"
  description = "Endpoint for service 122."
  type        = "String"
  value       = "https://service-122.internal"

  tags = local.tags
}
