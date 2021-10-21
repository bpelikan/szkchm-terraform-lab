resource "azurerm_storage_account" "st44sademo" {
  name                     = "st44sademo"
  resource_group_name      = data.azurerm_resource_group.main_rg.name
  location                 = data.azurerm_resource_group.main_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}