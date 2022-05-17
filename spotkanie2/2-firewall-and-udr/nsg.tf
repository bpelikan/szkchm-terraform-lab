resource "azurerm_network_security_group" "nsg-subnet01-hub-vnet01" {
  name                = "nsg-subnet01-hub-vnet01"
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name

  security_rule {
    name                       = "allow_ssh_from_home"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = chomp(data.http.myip.body)
    destination_address_prefix = azurerm_network_interface.hub-nic-vm01.private_ip_address
    description                = "AllowSSHfromHome"
    # destination_address_prefix = azurerm_public_ip.hub-pip.ip_address
  }

  security_rule {
    name                       = "allow_internal_vnet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.0.0/16"
    destination_address_prefix = "10.0.0.0/16"
    description                = "AllowInternalVnetTraffic"
  }


  security_rule {
    name                       = "blockall"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "DenyAll"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet01-hub-vnet01-association" {
  subnet_id                 = azurerm_subnet.hub-vnet01-subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg-subnet01-hub-vnet01.id
}


resource "azurerm_network_security_group" "nsg-subnet01-spoke-vnet02" {
  name                = "nsg-subnet01-spoke-vnet02"
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name

  security_rule {
    name                       = "allow_ssh_from_hub"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.4"
    destination_address_prefix = "10.1.0.4"
    description                = "AllowSSHfromHub"
  }

  security_rule {
    name                       = "blockall"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "DenyAll"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet01-spoke-vnet02-association" {
  subnet_id                 = azurerm_subnet.spoke-vnet02-subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg-subnet01-spoke-vnet02.id
}