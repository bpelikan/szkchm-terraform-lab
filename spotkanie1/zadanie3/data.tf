data "azurerm_resource_group" "main_rg" {
  name = "tf-rg"
}

output "resourceGroupLocation" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}
