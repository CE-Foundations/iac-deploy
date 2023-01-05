terraform {
  backend "gcs" {
    bucket = "fto-tf-state-0"
    prefix = "iac-deploy/1-fleet"
  }
}

data "terraform_remote_state" "baseline" {
  backend = "gcs"
  config = {
    bucket = "fto-tf-state-0"
    prefix = "iac-deploy/0-org"
  }
}