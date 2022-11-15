// An example fleet deployment
module "fleet_newyork_001" {
  source             = "github.com/secretspecialsauce/iac-fleet-mod"
  org_id             = var.org_id
  fleet_folder_name  = "fleet-newyork-001"
  region_folder_name = google_folder.usa.name
  billing_account_id = var.billing_account_id
}
