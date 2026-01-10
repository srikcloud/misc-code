variable "tools" {
    default = {
    vault = {
    vm_size = "Standard_B2als_v2"
    spot    = true
 }
}
}
variable "rg_name" {
    default = "rg-roboshop"
}
variable "rg_location" {
    default = "UK West"
}
