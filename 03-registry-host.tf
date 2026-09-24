# Host-qualified registry addresses.
# registry.opentofu.org is API-only; its browsable UI is search.opentofu.org.

module "hcp_terraform" {
  source  = "app.terraform.io/example-corp/k8s-cluster/azurerm"
  version = "1.0.0"
}

module "opentofu_registry" {
  source  = "registry.opentofu.org/terraform-aws-modules/vpc/aws"
  version = "6.7.3"
}

module "third_party_registry" {
  source = "registry.example.com/example-corp/networking/aws"
}
