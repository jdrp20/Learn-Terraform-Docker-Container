terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraforjony"
    container_name       = "states"
    key                  = "estados.tfstate"
  }
}
