resource "azurerm_storage_account" "example" {
  name                     = "roboshopdevtfstate"
  resource_group_name      = "rg-roboshop"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

