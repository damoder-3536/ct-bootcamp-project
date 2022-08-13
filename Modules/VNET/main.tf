resource "azurerm_virtual_network" "Vnet" {
    name = var.vnet_name
    address_space = var.address_space
    location = var.resource_group_location
    resource_group_name = var.resource_group_name
  
}