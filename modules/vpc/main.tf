variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

output "cidr_block" {
  value = var.cidr_block
}
