terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "748173f1-20c4-4e68-ac58-641f67a83501"
}

provider "azuread" {
  tenant_id = "4f0f3c22-2cbb-44c7-a530-ec9f729bd18e"
}