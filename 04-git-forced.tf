# Forced git protocol. Self-referential so links are assertable.

module "git_https_subdir_ref" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}

module "git_https_no_subdir" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git?ref=v1.0.0"
}

module "git_https_file_target" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc/main.tf?ref=v1.0.0"
}

module "git_ssh_scheme" {
  source = "git::ssh://git@github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}
