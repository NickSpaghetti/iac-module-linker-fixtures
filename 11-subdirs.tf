# Subdirectory notation across families. The registry + subdir case is
# currently unclassified by the linker.

module "registry_subdir" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "6.7.3"
}

module "git_nested_subdir" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}

module "shorthand_subdir" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures//modules/lambda"
}
