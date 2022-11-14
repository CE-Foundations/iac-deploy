# bigmac-iac-fleet-deploy
This repo deploys a full foundations organization structure using the bigmac-iac-backend (global control plane) and bigmac-iac-fleet-mod (fleet projects and control plane) repos. 

## Deploy the backend
To deploy the backend create new modules for meta, billing, automation, common services, network, and security sourcing their respective modules in bigmac-iac-backend repo. Then pass in org_id, billing_account_id, and a control plane folder name/id

## Deploye a fleet
To deploy a fleet create a region and country folder if applicable. Then create a module that sources the bigmac-iac-fleet-mod repo. Pass in an org_id, a fleet folder name, the name/id of its expected parent folder, and a billing_account_id