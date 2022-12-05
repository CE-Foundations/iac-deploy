// An example fleet deployment
module "fleet_innovcent_org" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet_org"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  fleet_name          = "innovcent"
  fleet_parent_folder = google_folder.usa.name
  billing_account_id  = var.billing_account_id
}
