provider "azurerm" {
     features {}
     subscription_id = "f7fcf972-1a3d-456c-a347-914d12f8c308"
}

terraform {
  backend "azurerm" {
    subscription_id      = "f7fcf972-1a3d-456c-a347-914d12f8c308"  
    resource_group_name  = "rg-roboshop"          
    storage_account_name = "roboshopdevtfstate"                              
    container_name       = "roboshop-state-file"                               
    key                  = "tools.terraform.tfstate"

  }
}

