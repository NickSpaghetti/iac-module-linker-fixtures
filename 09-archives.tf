# Archive sources. None of these have a browsable web UI, so they should be
# classified and labeled but NOT linked.

module "http_zip" {
  source = "https://example.com/vpc-module.zip"
}

module "s3_archive" {
  source = "s3::https://s3-eu-west-1.amazonaws.com/examplecorp-tofu-modules/vpc.zip"
}

module "gcs_archive" {
  source = "gcs::https://www.googleapis.com/storage/v1/modules/foomodule.zip"
}
