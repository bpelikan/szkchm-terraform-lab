data "azurerm_resource_group" "szkchm-tf" {
  name = "szkchm-tf"
}

data "http" "myip" {
  url = "https://api.ipify.org/"
}

output "myIP" {
  value = chomp(data.http.myip.body)
}