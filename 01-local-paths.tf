# Local paths. Targets exist in this repo, so links must resolve.

module "local_dir" {
  source = "./modules/vpc"
}

module "local_file_target" {
  source = "./modules/vpc/main.tf"
}

module "local_sibling" {
  source = "./modules/lambda"
}
