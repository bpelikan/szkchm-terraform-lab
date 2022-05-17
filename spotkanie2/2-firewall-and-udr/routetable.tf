resource "azurerm_route_table" "rt-subnet01-hub-vnet01" {
  name                = "rt-subnet01-hub-vnet01"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
}

resource "azurerm_route" "rtr-subnet01-hub-vnet01-to-subnet01-spoke-vnet02" {
  name                = "rtr-subnet01-hub-vnet01-to-subnet01-spoke-vnet02"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  route_table_name    = azurerm_route_table.rt-subnet01-hub-vnet01.name
  address_prefix      = azurerm_virtual_network.spoke-vnet02.address_space[0] # "10.1.0.0/16"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.firewall01.ip_configuration[0].private_ip_address # "10.0.255.4"
}

resource "azurerm_subnet_route_table_association" "rt-subnet01-hub-vnet01-association" {
  subnet_id      = azurerm_subnet.hub-vnet01-subnet01.id
  route_table_id = azurerm_route_table.rt-subnet01-hub-vnet01.id
}




resource "azurerm_route_table" "rt-subnet01-spoke-vnet02" {
  name                = "rt-subnet01-spoke-vnet02"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
}

resource "azurerm_route" "rtr-subnet01-spoke-vnet02-to-subnet01-hub-vnet01" {
  name                = "rtr-subnet01-spoke-vnet02-to-subnet01-hub-vnet01"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  route_table_name    = azurerm_route_table.rt-subnet01-spoke-vnet02.name
  address_prefix      = azurerm_virtual_network.hub-vnet01.address_space[0] # "10.0.0.0/16"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.firewall01.ip_configuration[0].private_ip_address # "10.0.255.4"
}

resource "azurerm_subnet_route_table_association" "rt-subnet01-spoke-vnet02-association" {
  subnet_id      = azurerm_subnet.spoke-vnet02-subnet01.id
  route_table_id = azurerm_route_table.rt-subnet01-spoke-vnet02.id
}

