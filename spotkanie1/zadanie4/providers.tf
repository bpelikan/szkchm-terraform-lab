terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "748173f1-20c4-4e68-ac58-641f67a83501"
}
