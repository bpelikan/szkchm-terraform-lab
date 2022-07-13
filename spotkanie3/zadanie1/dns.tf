# DNS - App service
resource "azurerm_private_dns_zone" "privatelink-azurewebsites-net" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = azurerm_resource_group.netops-prd-dns.name
}




# DNS link -> VNET-HUB
resource "azurerm_private_dns_zone_virtual_network_link" "vnet-hub-privatelink-azurewebsites-net-dnszone-virtuallink" {
  name                  = "vnet-hub-privatelink-azurewebsites-net-dnszone-virtuallink"
  resource_group_name   = azurerm_resource_group.netops-prd-dns.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink-azurewebsites-net.name
  virtual_network_id    = azurerm_virtual_network.vnet-hub.id
}


# DNS link -> VNET-SPOKE-PRD
resource "azurerm_private_dns_zone_virtual_network_link" "vnet-spoke-prd-privatelink-azurewebsites-net-dnszone-virtuallink" {
  name                  = "vnet-spoke-prd-privatelink-azurewebsites-net-dnszone-virtuallink"
  resource_group_name   = azurerm_resource_group.netops-prd-dns.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink-azurewebsites-net.name
  virtual_network_id    = azurerm_virtual_network.vnet-spoke-prd.id
}


# DNS link -> VNET-SPOKE-DEV
resource "azurerm_private_dns_zone_virtual_network_link" "vnet-spoke-dev-privatelink-azurewebsites-net-dnszone-virtuallink" {
  name                  = "vnet-spoke-dev-privatelink-azurewebsites-net-dnszone-virtuallink"
  resource_group_name   = azurerm_resource_group.netops-prd-dns.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink-azurewebsites-net.name
  virtual_network_id    = azurerm_virtual_network.vnet-spoke-dev.id
}