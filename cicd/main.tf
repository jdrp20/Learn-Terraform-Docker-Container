provider "azurerm" {
  features {}
  subscription_id = "e973f371-80ef-4813-9adc-d4c2f2b1c972"
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

import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/e973f371-80ef-4813-9adc-d4c2f2b1c972/resourceGroups/cicd-group/providers/Microsoft.Storage/storageAccounts/continousdeployment"
}

resource "azurerm_storage_container" "example" {
  name                  = "jonyreyes"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "container"
}
