resource "azurerm_kubernetes_cluster" "aks-dev-bp-01" {
  name                = "aks-dev-bp-01"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  dns_prefix          = "aks-dev-bp-01"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  #    addon_profile {
  #     oms_agent {
  #       enabled                    = true
  #       log_analytics_workspace_id = azurerm_log_analytics_workspace.dev-monitor-loganal01.id
  #     }
  #   }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }

  tags = {
    Environment = "Production"
  }
}

# output "client_certificate" {
#   value = azurerm_kubernetes_cluster.aks-dev-bp-01.kube_config.0.client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks-dev-bp-01.kube_config_raw
#   sensitive = true
# }

data "azurerm_monitor_diagnostic_categories" "azurerm_monitor_diagnostic_setting_aks" {
  resource_id = azurerm_kubernetes_cluster.aks-dev-bp-01.id
}

output "azurerm_monitor_diagnostic_setting_aks_logs" {
  value = data.azurerm_monitor_diagnostic_categories.azurerm_monitor_diagnostic_setting_aks.logs
}

output "azurerm_monitor_diagnostic_setting_aks_metrics" {
  value = data.azurerm_monitor_diagnostic_categories.azurerm_monitor_diagnostic_setting_aks.metrics
}


resource "azurerm_monitor_diagnostic_setting" "aks-dev-bp-01-monitoring" {
  name                       = "diagnostics-${azurerm_kubernetes_cluster.aks-dev-bp-01.name}"
  target_resource_id         = azurerm_kubernetes_cluster.aks-dev-bp-01.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.dev-monitor-loganal01.id
  # storage_account_id = azurerm_storage_account.stlogs.id

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "cloud-controller-manager"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "cluster-autoscaler"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "kube-apiserver"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

}
