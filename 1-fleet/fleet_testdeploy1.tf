# Creates "innovcent" fleet, org hierarchy: folders, projects, and enables services
module "fleet_testdeploy1" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  billing_account_id  = var.billing_account_id
  fleet_name          = "testdeploy1"
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
    "clus-matt-1" = {
      peer_ips      = ["24.13.15.63", "24.13.15.63"]
      shared_secret = "vllGEsry26GvAZy8Q508Ykjcd6MBzOxJ"
      router_ips = {
        interface1 = {
          ip_range = "169.254.0.1/30"
          peer_ip  = "169.254.0.2"
          peer_asn = "64515"
        }
        interface2 = {
          ip_range = "169.254.1.3/30"
          peer_ip  = "169.254.1.2"
          peer_asn = "64515"
        }
      }
    }
  }
}

# Deploys one cluster's worth of resources
# Currently includes GSAs, SDS bucket & HMAC keys, Snapshot bucket
module "fleet_testdeploy1_clust-matt-1" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//cluster"

  cluster_name             = "clus-matt-1"
  fleet_project_id         = module.fleet_testdeploy1.fleet_project.project_id
  gsa_project_id           = module.fleet_testdeploy1.control_plane_service_account_project.project_id
  secrets_project_id       = module.fleet_testdeploy1.control_plane_secrets_project.project_id
  observability_project_id = module.fleet_testdeploy1.control_plane_observability_project.project_id
  network_project_id       = module.fleet_testdeploy1.control_plane_networking_project.project_id
  sds_project_id           = module.fleet_testdeploy1.fleet_project.project_id
  sds_bucket_prefix        = var.project_prefix
  sds_bucket_location      = "us-central1"
  snapshot_bucket_location = "us-central1"
}
