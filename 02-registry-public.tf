# Public registry: <NAMESPACE>/<NAME>/<PROVIDER>

module "registry_versioned" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"
}

module "registry_unversioned" {
  source = "terraform-aws-modules/security-group/aws"
}

module "registry_constraint" {
  source  = "terraform-aws-modules/rds/aws"
  version = ">= 6.0, < 7.0"
}
