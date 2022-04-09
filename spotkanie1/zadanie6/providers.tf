terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.97.0"
    }
  }

  backend "azurerm" {
        resource_group_name  = "szkchm-tf-state"
        storage_account_name = "szkchmtfstatebp"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
        access_key           = "Iqcj/9W93y8mdryHrnIql6DyWQ0j1sXszs3BsdNv2LrPkrCGmMjFZ3mWzOwPkl5AciqDtFdhwqFQlFD/z1ulKQ==" 
        # Może być przetrzymywany przy pomocy zmiennej środowiskowej ARM_ACCESS_KEY
    }
}

provider "azurerm" {
  features {}
  subscription_id = var.sub_id
}
