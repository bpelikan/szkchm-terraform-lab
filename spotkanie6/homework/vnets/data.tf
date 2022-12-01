data "azurerm_resource_group" "rg-hub-bp" {
  provider = azurerm.provider-hub-env
  name = "rg-hub-bp"
}

data "azurerm_resource_group" "rg-dev-bp" {
  provider = azurerm.provider-dev-env
  name = "rg-dev-bp"
}

data "azurerm_resource_group" "rg-mon-bp" {
  provider = azurerm.provider-dev-env
  name = "rg-mon-bp"
}