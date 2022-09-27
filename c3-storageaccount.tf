/*resource "azurerm_storage_account" "appsstore" {
  name                     = "appstore12345"
  resource_group_name      = azurerm_resource_group.ag_rg.name
  location                 = azurerm_resource_group.ag_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }

} */