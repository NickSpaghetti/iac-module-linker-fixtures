# OCI distribution sources. OpenTofu only - Terraform has no equivalent.

module "oci_plain" {
  source = "oci://example.com/repository-name"
}

module "oci_tag" {
  source = "oci://example.com/repository-name?tag=v1.0.0"
}

module "oci_digest" {
  source = "oci://example.com/repository-name?digest=sha256:abc123"
}
