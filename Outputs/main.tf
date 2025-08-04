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
  name     = var.rg_nombre222
  location = "eastus2"
}
