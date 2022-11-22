terraform {
  backend "gcs" {
    bucket = "fto-tf-state"
    prefix = "iac-deploy"
  }
}
