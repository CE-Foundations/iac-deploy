terraform {
  backend "gcs" {
    bucket = "test-edge-0-tfstate"
    prefix = "terraform/state/generic/iac-fleet-mod"
  }
}

data "terraform_remote_state" "baseline" {
  backend = "gcs"
  config = {
    bucket = "test-edge-0-tfstate"
    prefix = "terraform/state/generic/iac-fleet-org-mod"
  }
}