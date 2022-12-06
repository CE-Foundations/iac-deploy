// An example fleet deployment
module "fleet_innovcent_org" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet_org"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  fleet_name          = "innovcent"
  fleet_parent_folder = google_folder.usa.name
  billing_account_id  = var.billing_account_id
}

module "fleet_innovcent_sa_cluster_1" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//cluster_service_accounts"

  cluster_name       = "clus-1"
  gsa_project_id     = module.fleet_innovcent_org.control_plane_service_account_project.project_id
  gsa_iam_project_id = module.fleet_innovcent_org.fleet_project
}
