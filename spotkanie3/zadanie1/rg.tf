locals {
  location      = "westeurope"
  studentPrefix = "bp"
  tags = {
    "env"  = "dev"
    "task" = "zjazd3"
    "user" = "bpelikan"
  }
}

resource "azurerm_resource_group" "main_rg" {
  name     = format("%s-%s", var.rg-name, local.studentPrefix)
  location = local.location
  tags     = local.tags
}


resource "azurerm_resource_group" "netops-prd-hub" {
  name     = format("rg-%s-%s", local.studentPrefix, "netops-prd-hub")
  location = local.location
  tags     = local.tags
}

resource "azurerm_resource_group" "netops-prd-spoke" {
  name     = format("rg-%s-%s", local.studentPrefix, "netops-prd-spoke")
  location = local.location
  tags     = local.tags
}

resource "azurerm_resource_group" "netops-dev-spoke" {
  name     = format("rg-%s-%s", local.studentPrefix, "netops-dev-spoke")
  location = local.location
  tags     = local.tags
}