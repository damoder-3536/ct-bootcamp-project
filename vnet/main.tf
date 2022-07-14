resource "azurerm_virtual_network" "kd_vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space_vnet
  dns_servers         = var.dns_servers_vnet
}
