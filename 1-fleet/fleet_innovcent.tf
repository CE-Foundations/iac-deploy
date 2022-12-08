# Creates "innovcent" fleet, org hierarchy: folders, projects, and enables services
module "fleet_innovcent_org" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//fleet"

  org_id              = var.org_id
  project_prefix      = var.project_prefix
  billing_account_id  = var.billing_account_id
  fleet_name          = "innovcent"
  fleet_parent_folder = data.terraform_remote_state.baseline.outputs.folder_usa.id
  fleet_subnet = {
    subnet_name   = "fleet-us-central1",
    subnet_ip     = "172.16.100.0/24",
    subnet_region = "us-central1"
  }
  fleet_vpn_region         = "us-central1"
  fleet_vpn_router_bgp_asn = "64519"
  fleet_vpn_peer_config = {
    "cluster0" = {
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
    "cluster1" = {
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

# Deploys one cluster's worth of service accounts to service account project
module "fleet_innovcent_sa_cluster_1" {
  source = "github.com/secretspecialsauce/iac-fleet-mod//cluster_service_accounts"

  cluster_name = "clus-1"
  # Deploys GSAs to GSA proj, sets IAM on fleet project
  gsa_project_id     = module.fleet_innovcent_org.control_plane_service_account_project.project_id
  gsa_iam_project_id = module.fleet_innovcent_org.fleet_project.project_id
}
