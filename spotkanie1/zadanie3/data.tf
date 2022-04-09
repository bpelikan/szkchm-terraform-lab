data "azurerm_resource_group" "main_rg" {
  name = "szkchm-tf"
}

output "resourceGroupLocation" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}
