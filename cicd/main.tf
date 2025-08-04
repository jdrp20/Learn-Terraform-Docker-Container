provider "azurerm" {
  features {}
  subscription_id = "7a1cc0fb-ee8c-4a6d-9098-72ecea16d571"
}

resource "azurerm_resource_group" "rg" {
  name     = "cicd-group"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage" {
  name                     = "continousdeployment"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "jonyreyes"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "container"
}
