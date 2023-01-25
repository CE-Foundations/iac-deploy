terraform {
  backend "gcs" {
    bucket = "test-edge-0-tfstate"
    prefix = "terraform/state/generic/iac-fleet-org-mod"
  }
}
