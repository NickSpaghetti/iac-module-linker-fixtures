module "bitbucket_shorthand" {
  source = "bitbucket.org/example-corp/tofu-consul-aws"
}

module "bitbucket_subdir" {
  source = "bitbucket.org/example-corp/tofu-consul-aws//modules/consul"
}
