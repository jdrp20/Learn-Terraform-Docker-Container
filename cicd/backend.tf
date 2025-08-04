terraform {
  backend "azurerm" {
    storage_account_name = "estadosterraformjony"
    container_name       = "githubactionstate"
    key                  = "estados.tfstate"
  }
}
