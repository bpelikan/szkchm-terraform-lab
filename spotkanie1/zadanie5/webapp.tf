resource "azurerm_app_service_plan" "app-service-plan" {
  name                = "app-service-plan"
  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app-service" {
  for_each = var.app_names
  name     = each.value

  location            = data.azurerm_resource_group.main_rg.location
  resource_group_name = data.azurerm_resource_group.main_rg.name
  app_service_plan_id = azurerm_app_service_plan.app-service-plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}