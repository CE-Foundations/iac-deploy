# Creates "innovcent" fleet, org hierarchy: folders, projects, and enables services
module "fleet_innovcent_org" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet_org"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  fleet_name          = "innovcent"
  fleet_parent_folder = data.terraform_remote_state.baseline.outputs.folder_usa.id
  billing_account_id  = var.billing_account_id
}

# Deploys one cluster's worth of service accounts to service account project
module "fleet_innovcent_sa_cluster_1" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//cluster_service_accounts"

  cluster_name = "clus-1"
  # Deploys GSAs to GSA proj, sets IAM on fleet project
  gsa_project_id     = module.fleet_innovcent_org.control_plane_service_account_project.project_id
  gsa_iam_project_id = module.fleet_innovcent_org.fleet_project.project_id
}