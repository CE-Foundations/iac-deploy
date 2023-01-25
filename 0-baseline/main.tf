terraform {
  backend "gcs" {
    bucket = var.state_bucket
    prefix = "terraform/state/generic/iac-fleet-org-mod"
  }
}
