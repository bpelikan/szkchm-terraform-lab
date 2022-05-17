resource "azurerm_virtual_network" "hub-vnet01" {
  name                = "hub-vnet01"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
}

resource "azurerm_virtual_network" "spoke-vnet02" {
  name                = "spoke-vnet02"
  address_space       = ["10.1.0.0/16"]
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
}


resource "azurerm_subnet" "hub-vnet01-subnet01" {
  name                 = "hub-vnet01-subnet01"
  address_prefixes     = ["10.0.0.0/24"]
  resource_group_name  = data.azurerm_resource_group.szkchm-tf.name
  virtual_network_name = azurerm_virtual_network.hub-vnet01.name
}

resource "azurerm_subnet" "spoke-vnet02-subnet01" {
  name                 = "spoke-vnet02-subnet01"
  address_prefixes     = ["10.1.0.0/24"]
  resource_group_name  = data.azurerm_resource_group.szkchm-tf.name
  virtual_network_name = azurerm_virtual_network.spoke-vnet02.name
}


resource "azurerm_virtual_network_peering" "hub-vnet01-to-spoke-vnet02" {
  name                      = "hub-vnet01-to-spoke-vnet02"
  resource_group_name       = data.azurerm_resource_group.szkchm-tf.name
  virtual_network_name      = azurerm_virtual_network.hub-vnet01.name
  remote_virtual_network_id = azurerm_virtual_network.spoke-vnet02.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "spoke-vnet02-to-hub-vnet01" {
  name                      = "spoke-vnet02-to-hub-vnet01"
  resource_group_name       = data.azurerm_resource_group.szkchm-tf.name
  virtual_network_name      = azurerm_virtual_network.spoke-vnet02.name
  remote_virtual_network_id = azurerm_virtual_network.hub-vnet01.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}