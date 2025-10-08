terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorageacct"  # Replace with your storage account name
    container_name       = "tfstate"
    key                  = "devops-pipeline.tfstate"
  }
}
