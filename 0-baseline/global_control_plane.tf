# Implements "global control plane" modules to create org, folder, project structure
module "top_level_org" {
  source = "github.com/secretspecialsauce/iac-global-control-plane-mod//top_level_org"
  org_id = var.org_id
}

module "global_control_plane_billing_org" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//billing_org"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
#  global_control_plane_folder_name = module.top_level_org.global_control_plane_folder_name
  global_control_plane_folder_name = foobar
  project_prefix                   = var.project_prefix
}

module "global_control_plane_automation_org" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//automation_resources"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.top_level_org.global_control_plane_folder_name
  project_prefix                   = var.project_prefix
}

module "global_control_plane_common_services_org" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//common_services_org"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.top_level_org.global_control_plane_folder_name
  project_prefix                   = var.project_prefix
}

module "global_control_plane_network_org" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//network_org"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.top_level_org.global_control_plane_folder_name
  project_prefix                   = var.project_prefix
}

module "global_control_plane_security_org" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//security_org"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.top_level_org.global_control_plane_folder_name
  project_prefix                   = var.project_prefix
}
