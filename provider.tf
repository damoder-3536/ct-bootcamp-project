terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.11.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dm-resourcegroup"
    storage_account_name = "dmstorageaccount3536"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}

provider "azurerm" {
  features {

  }
}