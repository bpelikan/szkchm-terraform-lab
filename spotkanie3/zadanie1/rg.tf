locals {
  location      = "westeurope"
  studentPrefix = "bp"
  tags = {
    "env"  = "dev"
    "task" = "zjazd3"
  }
}

resource "azurerm_resource_group" "main_rg" {
  name     = format("%s-%s", var.rg-name, local.studentPrefix)
  location = local.location
  tags     = local.tags
}
