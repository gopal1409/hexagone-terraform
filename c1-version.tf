####we will create a provider block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    features {}
}

provider "azurerm" {
    features {
      virtual_machine {
        delete_os_disk_on_deletion=false #this will ensure that when you delete your vm storage will not be deleted
      }
    }
         alias="provider2-westus"
      #client_id="XXXX"
      #client_secret="xxxxx"
      #environment = "german"
      #subscription_id="123"
 
}
####create a resource group
