module "backend_meta" {
  source = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-meta"
  org_id = var.org_id
}

module "backend_billing" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-billing"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.backend_meta.global_control_plane_folder_name
}

module "backend_automation" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-automation"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.backend_meta.global_control_plane_folder_name
}

module "backend_common_services" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-common-services"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.backend_meta.global_control_plane_folder_name
}

module "backend_network" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-network"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.backend_meta.global_control_plane_folder_name
}

module "backend_security" {
  source                           = "github.com/secretspecialsauce/iac-global-control-plane-mod//module-backend-security"
  org_id                           = var.org_id
  billing_account_id               = var.billing_account_id
  global_control_plane_folder_name = module.backend_meta.global_control_plane_folder_name
}
