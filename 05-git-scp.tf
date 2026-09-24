# scp-style addresses. The bare form (no git:: prefix) is currently
# unclassified by the linker.

module "scp_with_forced_type" {
  source = "git::git@github.com:NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}

module "scp_bare" {
  source = "git@github.com:NickSpaghetti/iac-module-linker-fixtures.git"
}

module "scp_bare_subdir" {
  source = "git@github.com:NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc"
}
