resource "azurerm_role_assignment" "user01-rgcreator-role" {
  scope                = "/subscriptions/${var.sub-id}"
  role_definition_name = azurerm_role_definition.chm-dev-rgcreator.name
  principal_id         = data.azuread_user.user01.object_id
}


resource "azurerm_role_assignment" "user01-nsgcontributor-role" {
  scope                = "/subscriptions/${var.sub-id}/resourceGroups/rg_test_01/"
  role_definition_name = azurerm_role_definition.chm-dev-nsgcontributor.name
  principal_id         = data.azuread_user.user01.object_id
}