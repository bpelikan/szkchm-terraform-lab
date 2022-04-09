resource "azurerm_storage_account" "st44sademoimport" {
  name                     = "st44sademoimport"
  resource_group_name      = data.azurerm_resource_group.main_rg.name
  location                 = data.azurerm_resource_group.main_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# terraform import azurerm_storage_account.st44sademoimport /subscriptions/748173f1-20c4-4e68-ac58-641f67a83501/resourceGroups/szkchm-tf/providers/Microsoft.Storage/storageAccounts/st44sademoimport