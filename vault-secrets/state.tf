provider "vault" {
 address = "http://vault.srikanth553.store:8200"
 token = var.token
}

terraform {
  backend "azurerm" {
    use_cli              = true                                    
    # tenant_id            = "00000000-0000-0000-0000-000000000000"  
    subscription_id      = "f7fcf972-1a3d-456c-a347-914d12f8c308"  
    resource_group_name  = "rg-roboshop"          
    storage_account_name = "roboshopdevtfstate"                              
    container_name       = "roboshop-state-file"                               
    key                  = "vault.terraform.tfstate"                
  }
}
