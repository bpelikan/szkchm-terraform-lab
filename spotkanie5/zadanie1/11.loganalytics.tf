resource "azurerm_resource_group" "dev-minitoring-rg" {
  name     = "dev-minitoring-rg"
  location = "westeurope"
}

resource "azurerm_log_analytics_workspace" "dev-monitor-loganal01" {
  name                = "dev-monitor-loganal01"
  location            = azurerm_resource_group.dev-minitoring-rg.location
  resource_group_name = azurerm_resource_group.dev-minitoring-rg.name
  sku                 = "PerGB2018"
  #100GB dziennie - rezerwacje  
  retention_in_days = 30
  # 2.54 EUR za 1GB za 1 msc
  daily_quota_gb = 1
}
