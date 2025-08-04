provider "azurerm" {
  features {}
  subscription_id = "7a1cc0fb-ee8c-4a6d-9098-72ecea16d571"
}

variable "rg_nombre" {
  type = string
}

locals {
  group_name = "jony${var.rg_nombre}"
}

resource "azurerm_resource_group" "rg" {
  location = "mexicocentral"
  name     = local.group_name
}
 
