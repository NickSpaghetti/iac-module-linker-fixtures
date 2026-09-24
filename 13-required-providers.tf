# The terraform block. Providers resolve to a registry, not a repo.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
    okta = {
      source  = "okta/okta"
      version = "4.9.1"
    }
    bare_name_defaults_to_hashicorp = {
      source = "random"
    }
  }
}
