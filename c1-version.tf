####we will create a provider block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    random = {
        source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
    features {}
}
#random string resource
resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  number = false
}
