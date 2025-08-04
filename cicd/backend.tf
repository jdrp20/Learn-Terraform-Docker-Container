terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraforjony"
    container_name       = "githubactionstate"
    key                  = "estados.tfstate"
  }
}
