module "hg_http" {
  source = "hg::http://example.com/vpc.hg"
}

module "hg_ref" {
  source = "hg::http://example.com/vpc.hg?ref=default"
}
