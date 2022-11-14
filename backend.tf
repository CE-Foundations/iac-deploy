terraform {
  backend "gcs" {
    bucket  = "inf-mcdtest-state-743"
    prefix  = "terraform/state"
  }
}

