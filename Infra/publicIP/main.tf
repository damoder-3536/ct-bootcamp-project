resource "azurerm_public_ip" "publicip" {
  name                = var.publicip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method_publicip
  domain_name_label   = var.resource_group_name
}