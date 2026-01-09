provider "azurerm" {
     features {}
     subscription_id = "f7fcf972-1a3d-456c-a347-914d12f8c308"
}

resource "azurerm_storage_account" "example" {
  name                     = "roboshopdevtfstate"
  resource_group_name      = "rg-roboshop"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "roboshop-state-file"
  storage_account_id    = azurerm_storage_account.example.id
  container_access_type = "private"
}