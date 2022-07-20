#
# TODO; zmiana resource providera
#
resource "azurerm_role_definition" "chm-dev-networkjoin" {
  name        = "chm-dev-networkjoin"
  scope       = "/subscriptions/${var.sub-id}"
  description = "chm-dev-networkjoin"

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Portal/dashboards/read",
      "Microsoft.ResourceHealth/*/read",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/join/action",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/write",
      "Microsoft.Network/networkSecurityGroups/read",
      "Microsoft.Network/routeTables/read"
    ]
    not_actions = []
  }
}

#
# Rola pozwala na modyfikację NSG w ramach konrektnego NSG, utworzonego na potrzeby danego projektu
# Rola nadawana na potrzeby danego projektu
#
resource "azurerm_role_definition" "chm-dev-nsgcontributor" {
  name        = "chm-dev-nsgcontributor"
  scope       = "/subscriptions/${var.sub-id}"
  description = "chm-dev-nsgcontributor # Rola pozwala na modyfikację NSG w ramach konrektnego NSG, utworzonego na potrzeby danego projektu # Rola nadawana na potrzeby danego projektu"

  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Portal/dashboards/read",
      "Microsoft.ResourceHealth/*/read",
      "Microsoft.Network/networkSecurityGroups/*"
    ]
    not_actions = []
  }

}

# Pozwala tworzyć grupy zasobów
resource "azurerm_role_definition" "chm-dev-rgcreator" {
  name        = "chm-dev-rgcreator"
  scope       = "/subscriptions/${var.sub-id}"
  description = "chm-dev-rgcreator # Pozwala tworzyć grupy zasobów"
  permissions {
    actions = [
      "Microsoft.Resources/subscriptions/resourceGroups/*",
      "Microsoft.Authorization/roleAssignments/*"
    ]

    not_actions = [
    ]
  }
}
