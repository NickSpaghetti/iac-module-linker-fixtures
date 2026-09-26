# Ten registry modules. Each one is a round trip.

terraform {
  required_version = ">= 1.5.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = ">= 6.0, < 7.0"
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"
}

module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "~> 5.0"
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 7.0"
}

module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.0"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 5.0"
}
