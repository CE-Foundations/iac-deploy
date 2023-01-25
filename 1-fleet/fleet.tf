# Creates "innovcent" fleet, org hierarchy: folders, projects, and enables services
module "fleet_poc" {
  source = "github.com/CE-Foundations/iac-fleet-mod/tree/testing//fleet"
  tf_state_bucket = "test-edge-0-tfstate"
  org_id              = var.org_id
  billing_account_id  = var.billing_account_id
  # fleet_name          = "poc"
#   fleet_parent_folder = data.terraform_remote_state.baseline.outputs.folder_usa.id

  # VPN configuration
  fleet_subnet = {
    subnet_name   = "fleet-us-central1",
    subnet_ip     = "172.16.100.0/24",
    subnet_region = "us-central1"
  }

  # VPN configuration
  fleet_vpn_region         = "us-central1"
  fleet_vpn_router_bgp_asn = "64519"
  fleet_vpn_peer_config = [
    {
      name          = "cluster0"             # Cluster name (Unique)
      fleet         = "fleet-1a-001"
      peer_ips      = ["8.8.8.8", "8.8.4.4"] # IPs allowed to connect to this HA VPN gateway
      shared_secret = "foobarbazquux"        # HA VPN shared secret
      # configuration used by BGP sessions for each cluster; this is a link-local config
      router_ips = {
        # must have 2 interfaces as this is HA VPN
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
    },
    {
      name          = "cluster1"
      fleet         = "fleet-1a-001"
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
    },
    {
      name          = "cluster2"
      fleet         = "fleet-1a-002"
      peer_ips      = ["8.8.8.8", "8.8.4.4"] # IPs allowed to connect to this HA VPN gateway
      shared_secret = "foobarbazquux"        # HA VPN shared secret
      # configuration used by BGP sessions for each cluster; this is a link-local config
      router_ips = {
        # must have 2 interfaces as this is HA VPN
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
    },
    {
      name          = "cluster3"
      fleet         = "fleet-1a-002"
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
  ]
}

# Deploys one cluster's worth of resources
# Currently includes GSAs
# module "fleet_poc_cluster_1" {
#   source = "github.com/secretspecialsauce/iac-fleet-mod//cluster"

#   cluster_name             = "clus-1"
#   fleet_project_id         = module.fleet_poc.fleet_project.project_id
#   gsa_project_id           = module.fleet_poc.control_plane_service_account_project.project_id
#   secrets_project_id       = module.fleet_poc.control_plane_secrets_project.project_id
#   observability_project_id = module.fleet_poc.control_plane_observability_project.project_id
#   network_project_id       = module.fleet_poc.control_plane_networking_project.project_id
#   sds_project_id           = module.fleet_poc.fleet_project.project_id
#   sds_bucket_prefix        = var.project_prefix
#   sds_bucket_location      = "us-central1"
#   snapshot_bucket_location = "us-central1"
# }