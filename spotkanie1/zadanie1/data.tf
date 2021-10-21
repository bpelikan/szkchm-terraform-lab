data "azurerm_resource_group" "main_rg" {
  name = "tf-rg"
}

data "azuread_user" "user" {
  user_principal_name = "tf-st44@chmfnd.onmicrosoft.com"
}

output "resourceGroupLocation" {
  value       = data.azurerm_resource_group.main_rg.location
  description = "resourceGroupLocation"
}

output "userId" {
  value       = data.azuread_user.user.id
  description = "User ID"
}

output "userDisplayName" {
  value       = data.azuread_user.user.display_name
  description = "Display name"
}