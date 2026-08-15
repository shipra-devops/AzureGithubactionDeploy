# Configure Azure Storage Account as Remote State Backend
# Note: You can supply backend config parameters dynamically via `terraform init -backend-config=...`
# or set specific environment variables (ARM_ACCESS_KEY / ARM_SAS_TOKEN).

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-dev-eastus-001"
    storage_account_name = "sttfstatedeveastus0011"
    container_name       = "tfstate"
    key                  = "vms-deployment.tfstate"
    use_azuread_auth     = true
    use_oidc             = true
  }
}
