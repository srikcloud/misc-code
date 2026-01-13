resource "azurerm_public_ip" "publicip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/f7fcf972-1a3d-456c-a347-914d12f8c308/resourceGroups/rg-roboshop/providers/Microsoft.Network/virtualNetworks/roboshop-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}


resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/f7fcf972-1a3d-456c-a347-914d12f8c308/resourceGroups/rg-roboshop/providers/Microsoft.Network/networkSecurityGroups/roboshop-nsg"
}

############# We moved to spot instance for saving the cost
# resource "azurerm_virtual_machine" "vm" {
#   name                  = var.name
#   location              = var.rg_location
#   resource_group_name   = var.rg_name
#   network_interface_ids = [azurerm_network_interface.privateip.id]
#   vm_size               = var.vm_size
#   delete_os_disk_on_termination = true

#   storage_image_reference {
#    id = "/subscriptions/f7fcf972-1a3d-456c-a347-914d12f8c308/resourceGroups/rg-roboshop/providers/Microsoft.Compute/images/local-devops-practice"
#   }
#   storage_os_disk {
#     name              = "${var.name}-disk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = var.name
#     admin_username = "azureuser"
#     admin_password = "DevOps@123456"
#   }
#  os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.name
  location                        = var.rg_location
  resource_group_name             = var.rg_name
  size                            = var.vm_size
  admin_username                  = "azureuser"
  admin_password                  = "DevOps@123456"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.privateip.id]

  os_disk {
    name                 = "${var.name}-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_id = "/subscriptions/f7fcf972-1a3d-456c-a347-914d12f8c308/resourceGroups/rg-roboshop/providers/Microsoft.Compute/images/local-devops-practice"
  
  # # Spot Details
  # priority        = "Spot"
  # max_bid_price   = -1
  # eviction_policy = "Deallocate"
}
resource "azurerm_dns_a_record" "public_dns_record" {
  depends_on          = [ azurerm_linux_virtual_machine.vm ]
  name                = var.name
  zone_name           = "srikanth553.store"
  resource_group_name = "rg-devops"
  ttl                 = 3
  records             = [azurerm_public_ip.publicip.ip_address]
}

resource "azurerm_dns_a_record" "private_dns_record" {
  name                = "${var.name}-int"
  zone_name           = "srikanth553.store"
  resource_group_name = "rg-devops"
  ttl                 = 3
  records             = [azurerm_network_interface.privateip.private_ip_address]
}

