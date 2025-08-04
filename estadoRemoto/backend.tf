terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraformjony"
    container_name       = "states"
    key                  = "estados.tfstate"
  }
}
