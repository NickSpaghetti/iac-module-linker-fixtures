# GitHub shorthand. Detectors should expand these to git over https.

module "gh_shorthand" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures"
}

module "gh_shorthand_subdir" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures//modules/vpc"
}

module "gh_shorthand_ref" {
  source = "github.com/NickSpaghetti/iac-module-linker-fixtures?ref=v1.0.0"
}
