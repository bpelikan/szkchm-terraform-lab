#######################
## VM01 Hub

resource "azurerm_network_interface" "hub-nic-vm01" {
  name                = "hub-nic-vm01"
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name

  ip_configuration {
    name                          = "hub-nic-vm01-ipconfig01"
    subnet_id                     = azurerm_subnet.hub-vnet01-subnet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.hub-pip.id
  }
}

resource "azurerm_public_ip" "hub-pip" {
  name                = "hub-pip"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "hub-vm01" {
  name                = "hub-vm01"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
  size                = "Standard_B1ls"

  disable_password_authentication = false
  admin_username                  = var.username
  admin_password                  = var.password

  network_interface_ids = [
    azurerm_network_interface.hub-nic-vm01.id,
  ]

  os_disk {
    name                 = "hub-vm01-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

output "hub-pip-value" {
  value = azurerm_public_ip.hub-pip.ip_address
}


#######################
## VM02 Spoke

variable "vmnameprefix" {
  default = "vm02"
}

resource "azurerm_network_interface" "spoke-nic-vm02" {
  name                = "spoke-nic-${var.vmnameprefix}"
  location            = data.azurerm_resource_group.szkchm-tf.location
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name

  ip_configuration {
    name                          = "spoke-nic-${var.vmnameprefix}-ipconfig01"
    subnet_id                     = azurerm_subnet.spoke-vnet02-subnet01.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "spoke-vm02" {
  name                = "spoke-${var.vmnameprefix}"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
  size                = "Standard_B1ls"

  disable_password_authentication = false
  admin_username                  = var.username
  admin_password                  = var.password

  network_interface_ids = [
    azurerm_network_interface.spoke-nic-vm02.id,
  ]

  os_disk {
    name                 = "spoke-${var.vmnameprefix}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
