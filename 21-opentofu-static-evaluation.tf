# OpenTofu reads .tf files too, so its evaluated sources and versions can be
# written here. Terraform would reject this file.

variable "vpc_version" {
  default = "6.7.3"
}

locals {
  registry = "terraform-aws-modules"
}

module "registry_from_locals" {
  source  = "${local.registry}/vpc/aws"
  version = var.vpc_version
}
