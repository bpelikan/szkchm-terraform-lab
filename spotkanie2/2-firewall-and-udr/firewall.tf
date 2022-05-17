
resource "azurerm_public_ip" "firewall-pip" {
  name                = "firewall-pip"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "firewall01" {
  name                = "firewall01"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location

  firewall_policy_id = azurerm_firewall_policy.firewall01-policy.id

  ip_configuration {
    name                 = "firewal-configuration"
    subnet_id            = azurerm_subnet.hub-vnet01-subnet-firewall.id
    public_ip_address_id = azurerm_public_ip.firewall-pip.id
  }
}

resource "azurerm_firewall_policy" "firewall01-policy" {
  name                = "firewall01-policy"
  resource_group_name = data.azurerm_resource_group.szkchm-tf.name
  location            = data.azurerm_resource_group.szkchm-tf.location
}


resource "azurerm_firewall_policy_rule_collection_group" "firewall01-policy_rule_collection_10_0_0_0__24" {

  name               = "firewall01-policy_rule_collection_10_0_0_0__24"
  firewall_policy_id = azurerm_firewall_policy.firewall01-policy.id
  priority           = 1000

  network_rule_collection {
    name     = "rule_net_10_0_0_0__24"
    priority = 1000
    action   = "Allow"

    rule {
      name                  = "net_10.0.0.4_tcp_22"
      protocols             = ["TCP"]
      source_addresses      = ["10.0.0.4"]
      destination_addresses = ["10.1.0.4"]
      destination_ports     = ["22"]
    }

    rule {
      name                  = "net_10.1.0.4_tcp_22"
      protocols             = ["TCP"]
      source_addresses      = ["10.1.0.0/16"]
      destination_addresses = ["10.0.0.0/16"]
      destination_ports     = ["*"]
    }
  }
}




output "firewall-pip" {
  value = azurerm_public_ip.firewall-pip.ip_address
}

output "firewall-private-ip" {
  value = azurerm_firewall.firewall01.ip_configuration[0].private_ip_address
}