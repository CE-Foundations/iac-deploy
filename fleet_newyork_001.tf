// An example fleet deployment
module "fleet_innovcent-001" {
  source             = "github.com/secretspecialsauce/iac-fleet-mod"
  org_id             = var.org_id
  fleet_folder_name  = "fleet-innovcent-001"
  region_folder_name = google_folder.usa.name
  billing_account_id = var.billing_account_id
}
