data "azurerm_resource_group" "imported_rg" {
  name = "GrupoPrevio"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "almacenamientopreviojony"
  resource_group_name      = data.azurerm_resource_group.imported_rg.name
  location                 = data.azurerm_resource_group.imported_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
