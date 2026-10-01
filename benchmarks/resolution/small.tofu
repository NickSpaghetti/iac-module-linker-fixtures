# Ten registry modules. Each one is a round trip.

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

# OpenTofu twin of the .tf file: each version is a variable default and each
# registry namespace a local, so every source and version is evaluated. They
# come last so every module sits on the same line as in the .tf file.

variable "vpc_version" {
  default = "~> 5.0"
}

variable "rds_version" {
  default = ">= 6.0, < 7.0"
}

variable "security_group_version" {
  default = "~> 5.1"
}

variable "eks_version" {
  default = "~> 20.0"
}

variable "s3_bucket_version" {
  default = "~> 4.0"
}

variable "alb_version" {
  default = "~> 9.0"
}

variable "iam_version" {
  default = "~> 5.0"
}

variable "lambda_version" {
  default = "~> 7.0"
}

variable "ecs_version" {
  default = "~> 5.0"
}

variable "acm_version" {
  default = "~> 5.0"
}

locals {
  terraform_aws_modules = "terraform-aws-modules"
}
