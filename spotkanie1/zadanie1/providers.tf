terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "24eafb4c-3855-419f-adbb-cc08869b1754"
}

provider "azuread" {
  tenant_id = "9354c60b-bf0f-4a7f-9e59-7e80b81c626c"
}