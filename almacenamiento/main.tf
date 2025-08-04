terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7a1cc0fb-ee8c-4a6d-9098-72ecea16d571"
}

resource "azurerm_resource_group" "resource_group" {
  name     = "grupoAlmacenamieto"
  location = "brazilsouth"
}

resource "azurerm_storage_account" "storage_account" {
  name                          = "amindevjony"
  resource_group_name           = azurerm_resource_group.resource_group.name
  location                      = azurerm_resource_group.resource_group.location
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = false


  tags = {
    environment = "staging"
  }
}

output "cadena_conexion" {
  value     = azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}
