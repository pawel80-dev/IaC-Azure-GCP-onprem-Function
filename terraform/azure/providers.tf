terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = "~> 3.87.0"
    }
  }
 # Hashicorp recommends using the cloud block instead of the backend block (legacy)
  cloud {
    organization = "tf-pawel-org"
    workspaces {
      name = "tf-azure"
    }
  }
}

provider "azurerm" {
  features {}
}
