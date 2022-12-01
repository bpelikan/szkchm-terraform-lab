resource "azurerm_resource_group" "ab_resource_group" {
    # provider = azurerm.dev-sub
    name                    = var.resource_group_object.name
    location                = var.resource_group_object.location

    tags                    = var.resource_group_tags

    lifecycle {
      ignore_changes = [
          tags
      ]
    }    
}

resource "azurerm_management_lock" "resource_group_level_lock" {
    # provider = azurerm.dev-sub
    name                    = "${var.resource_group_object.name}-level-lock"
    count                   = var.resource_group_object.lock_level == null || var.resource_group_object.lock_level == "" ? 0 : 1

    scope                   = azurerm_resource_group.ab_resource_group.id
    lock_level              = var.resource_group_object.lock_level
    notes                   = "Resource Group '${var.resource_group_object.name}' zablokowana"

}


# resource "azurerm_resource_group" "ab_resource_group_2" {
#     provider = azurerm.dev-sub
#     name                    = "${var.resource_group_object.name}-2"
#     location                = var.resource_group_object.location

#     tags                    = var.resource_group_tags

#     lifecycle {
#       ignore_changes = [
#           tags
#       ]
#     }    
# }