provider "azurerm" {
  features {}
  subscription_id = "7a1cc0fb-ee8c-4a6d-9098-72ecea16d571"
}

import {
  to = azurerm_storage_account.mi_cuenta
  id = "/subscriptions/7a1cc0fb-ee8c-4a6d-9098-72ecea16d571/resourceGroups/logsGroup/providers/Microsoft.Storage/storageAccounts/logsstorageaccount23"
}

resource "azurerm_storage_account" "mi_cuenta" {
  name                     = "logsstorageaccount23"
  resource_group_name      = "logsGroup"
  location                 = "brazilsouth"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

