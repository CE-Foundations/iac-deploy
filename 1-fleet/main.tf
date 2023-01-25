terraform {
  backend "gcs" {
    bucket = "${var.state_bucket}"
    prefix = "terraform/state/generic/iac-fleet-mod"
  }
}

data "terraform_remote_state" "baseline" {
  backend = "gcs"
  config = {
    bucket = "${var.state_bucket}"
    prefix = "terraform/state/generic/iac-fleet-org-mod"
  }
}