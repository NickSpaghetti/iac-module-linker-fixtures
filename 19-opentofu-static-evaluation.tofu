# OpenTofu 1.8+ evaluates variables and locals in a module's source and version
# before state exists. Terraform allows only literal strings there.

variable "vpc_version" {
  default = "6.7.3"
}

variable "fixtures_ref" {
  default = "v1.0.0"
}

variable "env" {
  default = "prod"
}

variable "not_set_here" {
  type = string
}

locals {
  fixtures = "github.com/NickSpaghetti/iac-module-linker-fixtures"
  # Refers to a local written after it.
  vpc_path = "${local.modules_dir}/vpc"
}

locals {
  modules_dir  = "modules"
  registry     = "terraform-aws-modules"
  vpc_git      = "git::https://${local.fixtures}.git//${local.vpc_path}?ref=${var.fixtures_ref}"
  pinned = {
    consul_old = "0.1.0"
    consul_new = "0.11.0"
  }
}

module "templated_shorthand" {
  source = "${local.fixtures}//${local.vpc_path}?ref=${var.fixtures_ref}"
}

module "templated_git" {
  source = "git::https://${local.fixtures}.git//modules/vpc?ref=${var.fixtures_ref}"
}

module "conditional_template" {
  source = "${var.env == "prod" ? local.fixtures : "example.com/unused"}//modules/vpc?ref=${var.fixtures_ref}"
}

module "registry_from_locals" {
  source  = "${local.registry}/vpc/aws"
  version = var.vpc_version
}

module "source_is_a_local" {
  source  = local.vpc_git
  # A git source takes no version.
}

module "consul_old" {
  source  = "hashicorp/consul/aws"
  version = local.pinned.consul_old
}

module "consul_new" {
  source  = "hashicorp/consul/aws"
  version = local.pinned.consul_new
}

module "unresolved_variable" {
  source = "${var.not_set_here}//modules/vpc"
}

module "unresolved_function" {
  source = format("%s//modules/vpc", local.fixtures)
}

module "unresolved_resource" {
  source = "${local.fixtures}//modules/${aws_s3_bucket.state.id}"
}

module "literal" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"
}
