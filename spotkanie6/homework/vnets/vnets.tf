module "vnet-hub" {
  source = "../../MODULES/virtual-network"
  providers = {
    azurerm = azurerm.provider-hub-env
  }
  vnet_object = {
    name            = "vnet-hub"
    rg_name         = data.azurerm_resource_group.rg-hub-bp.name
    address_space   = ["10.0.0.0/16"]
    dns_servers     = ["1.1.1.1"]
  }
}

module "vnet-spoke" {
  source = "../../MODULES/virtual-network"
  providers = {
    azurerm = azurerm.provider-dev-env
  }
  vnet_object = {
    name            = "vnet-dev"
    rg_name         = data.azurerm_resource_group.rg-dev-bp.name
    address_space   = ["10.1.0.0/16"]
    dns_servers     = ["1.1.1.1"]
  }
}

# module "vnet-mon" {
#   source = "../../MODULES/virtual-network"
# }

module "vnet-mon" {
  source = "../../MODULES/virtual-network"
  providers = {
    azurerm = azurerm.provider-dev-env
  }
  vnet_object = {
    name            = "vnet-mon"
    rg_name         = data.azurerm_resource_group.rg-mon-bp.name
    address_space   = ["10.2.0.0/16"]
    dns_servers     = ["1.1.1.1"]
  }
}