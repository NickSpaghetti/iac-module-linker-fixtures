# Revision selectors.

module "ref_tag" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}

module "ref_branch" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=main"
}

module "ref_with_depth" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0&depth=1"
}

module "no_ref_defaults_to_default_branch" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc"
}
