module "fleet_org" {
  source                           = "github.com/CE-Foundations/iac-fleet-org-mod"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  project_prefix                   = var.project_prefix
  parent_folder                    = var.parent_folder
}
