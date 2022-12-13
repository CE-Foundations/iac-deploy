# Creates "innovcent" fleet, org hierarchy: folders, projects, and enables services
module "fleet_poc" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  billing_account_id  = var.billing_account_id
  fleet_name          = "poc"
  fleet_parent_folder = data.terraform_remote_state.baseline.outputs.folder_usa.id

  # VPN configuration
  fleet_subnet = {
    subnet_name   = "fleet-us-central1",
    subnet_ip     = "172.16.100.0/24",
    subnet_region = "us-central1"
  }

  # VPN configuration
  fleet_vpn_region         = "us-central1"
  fleet_vpn_router_bgp_asn = "64519"
  fleet_vpn_peer_config = {
    "clus-1" = {
      peer_ips      = ["8.8.8.8", "8.8.4.4"]
      shared_secret = "foobarbazquux"
      router_ips = {
        interface1 = {
          ip_range = "169.254.0.1/30"
          peer_ip  = "169.254.0.2"
          peer_asn = "64515"
        }
        interface2 = {
          ip_range = "169.254.1.1/30"
          peer_ip  = "169.254.1.2"
          peer_asn = "64515"
        }
      }
    }
    "clus-2" = {
      peer_ips      = ["1.1.1.1", "1.0.0.1"]
      shared_secret = "foobarbazquux"
      router_ips = {
        interface1 = {
          ip_range = "169.254.2.1/30"
          peer_ip  = "169.254.2.2"
          peer_asn = "64515"
        }
        interface2 = {
          ip_range = "169.254.3.1/30"
          peer_ip  = "169.254.3.2"
          peer_asn = "64515"
        }
      }
    }
  }
}

# Deploys one cluster's worth of resources
# Currently includes GSAs
module "fleet_poc_cluster_0" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//cluster"

  cluster_name = "clus-1"

  # GCP project where GSAs are created
  gsa_project_id    = module.fleet_poc.control_plane_service_account_project.project_id
  secret_project_id = module.fleet_poc.control_plane_secret_manager_project.project_id
  # Projects where IAM bindings are created
  gsa_gcr_agent_iam_project              = module.fleet_poc.fleet_project.project_id
  gsa_abm_gke_connect_agent_iam_project  = module.fleet_poc.fleet_project.project_id
  gsa_abm_gke_register_agent_iam_project = module.fleet_poc.fleet_project.project_id
  gsa_abm_ops_agent_iam_project          = module.fleet_poc.fleet_project.project_id
  gsa_acm_monitoring_agent_iam_project   = module.fleet_poc.fleet_project.project_id
  gsa_external_secrets_iam_project       = module.fleet_poc.control_plane_secret_manager_project.project_id
  gsa_sds_backup_agent_iam_project       = module.fleet_poc.fleet_project.project_id # TODO buckets to be created
  gsa_gateway_connect_agent_iam_project  = module.fleet_poc.fleet_project.project_id
  gsa_cdi_import_agent_iam_project       = module.fleet_poc.fleet_project.project_id # TODO assign global control plane
  gsa_storage_agent_iam_project          = module.fleet_poc.fleet_project.project_id # TODO same as SDS
}
