module "tools-vm" {
  for_each = var.tools
  source = "./vm"
  rg_location = var.rg_location
  rg_name = var.rg_name
  name    = each.key
  vm_size = each.value["vm_size"]

}

