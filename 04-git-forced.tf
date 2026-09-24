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

# A forced VCS type wins over the file extension. This is a repository whose
# url happens to end in .zip, not an archive. The label and the link have to
# agree about which it is.
module "git_forced_beats_archive_extension" {
  source = "git::https://example.com/repo.zip"
}
