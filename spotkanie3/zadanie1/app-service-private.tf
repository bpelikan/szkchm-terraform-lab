
resource "azurerm_app_service_plan" "aps-bp-dev-01" {
  name                = var.app-serv-name
  location            = azurerm_resource_group.appservice-dev.location
  resource_group_name = azurerm_resource_group.appservice-dev.name

  sku {
    tier     = "Standard" #PremiumV2
    size     = "S1"       #P1v2
    capacity = 1
  }
}

resource "azurerm_app_service" "app-bp-appdev01" {
  name                = "${var.app-serv-name}-01-${local.studentPrefix}"
  location            = azurerm_resource_group.appservice-dev.location
  resource_group_name = azurerm_resource_group.appservice-dev.name
  app_service_plan_id = azurerm_app_service_plan.aps-bp-dev-01.id

  app_settings = {
    "WEBSITE_DNS_SERVER" : "168.63.129.16",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
    "ENVNAME" : "app-bp-appdev01"
  }
}

resource "azurerm_app_service" "app-bp-appdev02" {
  name                = "${var.app-serv-name}-02-${local.studentPrefix}"
  location            = azurerm_resource_group.appservice-dev.location
  resource_group_name = azurerm_resource_group.appservice-dev.name
  app_service_plan_id = azurerm_app_service_plan.aps-bp-dev-01.id

  app_settings = {
    "WEBSITE_DNS_SERVER" : "168.63.129.16",
    "WEBSITE_VNET_ROUTE_ALL" : "1"
    "ENVNAME" : "app-bp-appdev02"
  }
}




resource "azurerm_private_endpoint" "aps-bp-dev-01-pe" {
  name                = "aps-bp-dev-01-pe"
  location            = azurerm_resource_group.netops-prd-spoke.location
  resource_group_name = azurerm_resource_group.netops-prd-spoke.name
  subnet_id           = azurerm_subnet.vnet-spoke-prd-private-app-service-subnet.id

  private_service_connection {
    name                           = "aps-bp-dev-01-pe-connection"
    private_connection_resource_id = azurerm_app_service.app-bp-appdev01.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_a_record" "aps-bp-dev-01-pe-dns-a-record" {
  name = azurerm_app_service.app-bp-appdev01.name
  # name                = substr(azurerm_private_endpoint.aps-bp-dev-01-pe.custom_dns_configs[0].fqdn, 0, 23)
  zone_name           = azurerm_private_dns_zone.privatelink-azurewebsites-net.name
  resource_group_name = azurerm_resource_group.netops-prd-dns.name
  ttl                 = 300
  records             = azurerm_private_endpoint.aps-bp-dev-01-pe.custom_dns_configs[0].ip_addresses
}




resource "azurerm_private_endpoint" "aps-bp-dev-02-pe" {
  name                = "aps-bp-dev-02-pe"
  location            = azurerm_resource_group.netops-prd-spoke.location
  resource_group_name = azurerm_resource_group.netops-prd-spoke.name
  subnet_id           = azurerm_subnet.vnet-spoke-prd-private-app-service-subnet.id

  private_service_connection {
    name                           = "aps-bp-dev-02-pe-connection"
    private_connection_resource_id = azurerm_app_service.app-bp-appdev02.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_a_record" "aps-bp-dev-02-pe-dns-a-record" {
  name                = azurerm_app_service.app-bp-appdev02.name
  zone_name           = azurerm_private_dns_zone.privatelink-azurewebsites-net.name
  resource_group_name = azurerm_resource_group.netops-prd-dns.name
  ttl                 = 300
  records             = azurerm_private_endpoint.aps-bp-dev-02-pe.custom_dns_configs[0].ip_addresses
}