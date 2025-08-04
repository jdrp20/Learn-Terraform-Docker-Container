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
  name     = "azure-functions-test-rg"
  location = "eastus2"
}

module "azurefunctions" {
  source                    = "aminespinoza/azurefunctions/azurerm"
  rg_name                   = azurerm_resource_group.resource_group.name
  rg_location               = azurerm_resource_group.resource_group.location
  storage_account_name      = "functionsapptest20"
  app_service_name          = "azure-functions-test-service-plan"
  function_name             = "jony-platzi-function"
  storage_account_tier      = "Premium"
  storage_replication_type  = "LRS"
  app_service_plan_sku_tier = "Basic"
  app_service_plan_sku_size = "B2"
}
