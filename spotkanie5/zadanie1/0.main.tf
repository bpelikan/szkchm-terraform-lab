###
### TODO: Setup Your provider
###
provider "azurerm" {
  subscription_id = "748173f1-20c4-4e68-ac58-641f67a83501"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azuread" {
  # Configuration options
}

data "azurerm_subscription" "primary" {}

data "azuread_client_config" "current" {}

data "azurerm_client_config" "current" {}


#TODO
#terraform {
#  backend "azurerm" {
#    storage_account_name = "<ACCOUNT NAME>" 
#    container_name       = "<CONTAINER>" 
#    key                  = "cloudeng.shared.terraform.tfstate"  
#    access_key  = 
#  }
#}
