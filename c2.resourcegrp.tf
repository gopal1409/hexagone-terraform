resource "azurerm_resource_group" "ag_rg" {
  name     = "example-resources-gopal"
  location = "West Europe"
}

resource "azurerm_resource_group" "ag_rg1" {
  name     = "example-resources-gopal-2"
  location = "West US"
  provider = azurerm.provider2-westus
}
