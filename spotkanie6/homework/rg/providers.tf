provider "azurerm" {
  # subscription_id = var.hub-env-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azurerm" {
  alias = "provider-hub-env"
  subscription_id = var.hub-env-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}


provider "azurerm" {
  alias = "provider-dev-env"
  subscription_id = var.dev-env-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}


provider "azuread" {
  # Configuration options
}

