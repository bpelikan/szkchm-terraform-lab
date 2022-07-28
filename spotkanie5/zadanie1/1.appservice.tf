resource "azurerm_resource_group" "main_rg" {
  name     = "szkchm-tf-main_rg"
  location = "westeurope"
}


resource "azurerm_app_service_plan" "aps-bp-dev-01" {
  name                = "aps-bp-dev-01"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name

  sku {
    tier     = "Standard"
    size     = "S1"
    capacity = 1
  }
}

resource "azurerm_app_service" "app-bp-appdev01" {
  name                = "app-bp-appdev01"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  app_service_plan_id = azurerm_app_service_plan.aps-bp-dev-01.id
}

resource "azurerm_storage_account" "stlogs" {
  name                     = "stlogs12bp"
  location                 = azurerm_resource_group.main_rg.location
  resource_group_name      = azurerm_resource_group.main_rg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_monitor_diagnostic_setting" "app-bp-appdev01-monitoring" {
  name                       = "diagnostics-${azurerm_app_service.app-bp-appdev01.name}"
  target_resource_id         = azurerm_app_service.app-bp-appdev01.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.dev-monitor-loganal01.id
  storage_account_id         = azurerm_storage_account.stlogs.id

  #metryki i logi z App Service, ktore maja trafic do Log Analytics
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServicePlatformLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServiceAppLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServiceAuditLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServiceConsoleLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServiceIPSecAuditLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "AppServicePlatformLogs"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }
}

data "azurerm_monitor_diagnostic_categories" "azurerm_monitor_diagnostic_setting_azureappservice" {
  #ID Serwisu dla którego chcemy sprawdzić metryki i logi, które możemy logować
  resource_id = azurerm_app_service.app-bp-appdev01.id
}