module "rg-hub" {
  source = "../../MODULES/resource-group"
  providers = {
    # azurerm = azurerm.provider-hub-env
    azurerm.dev-sub = azurerm.provider-hub-env
  }

  resource_group_object = var.resource_group_object_rg_hub
  resource_group_tags = var.resource_group_tags_rg_hub
}

module "rg-dev" {
  source = "../../MODULES/resource-group"
  providers = {
    azurerm.dev-sub = azurerm.provider-dev-env
  }

  resource_group_object = var.resource_group_object_rg_dev
  resource_group_tags = var.resource_group_tags_rg_dev
}





