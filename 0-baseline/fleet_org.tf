module "fleet_org" {
  source                           = "github.com/CE-Foundations/iac-fleet-org-mod"
  org_id                           = var.org_id
  org                              = var.org
  parent_folder                    = var.parent_folder
}
