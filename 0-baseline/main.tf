terraform {
  backend "gcs" {
    bucket = "fto-tf-state-0"
    prefix = "iac-deploy/0-org"
  }
}
