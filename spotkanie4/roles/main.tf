terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.78.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.8.0"
    }
  }
}

provider "azuread" {
  # Configuration options
}

provider "azurerm" {
  features {}
  subscription_id = var.sub-id
}
