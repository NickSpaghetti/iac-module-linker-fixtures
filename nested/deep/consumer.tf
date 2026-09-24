# Relative traversal from a deep path. Exercises ../../ resolution against
# a GitHub blob URL.

module "up_two" {
  source = "../../modules/vpc"
}

module "up_two_file" {
  source = "../../modules/vpc/main.tf"
}
