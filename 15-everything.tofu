# .tofu extension - OpenTofu 1.8+. GitHub Linguist maps this to HCL, so the
# code viewer renders it identically to .tf.

module "tofu_registry" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"
}

module "tofu_oci" {
  source = "oci://example.com/repository-name?tag=v1.0.0"
}

module "tofu_git" {
  source = "git::https://github.com/NickSpaghetti/iac-module-linker-fixtures.git//modules/vpc?ref=v1.0.0"
}
