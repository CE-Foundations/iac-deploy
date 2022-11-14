module "backend_meta" {
  source = "../bigmac-iac-backend/module-backend-meta"
  org_id=var.org_id
}

module "backend_billing" {
  source = "../bigmac-iac-backend/module-backend-billing"
    org_id=var.org_id
billing_account_id = var.billing_account_id
}

module "backend_automation" {
source = "../bigmac-iac-backend/module-backend-automation"
  org_id=var.org_id
  billing_account_id = var.billing_account_id
}

module "backend_common_services" {
  source = "../bigmac-iac-backend/module-backend-common-services"
  org_id=var.org_id
  billing_account_id = var.billing_account_id
}

module "backend_network" {
      source = "../bigmac-iac-backend/module-backend-network"
  org_id=var.org_id
  billing_account_id = var.billing_account_id
}

module "backend_security" {
        source = "../bigmac-iac-backend/module-backend-security"
  org_id=var.org_id
  billing_account_id = var.billing_account_id
}
