data "azurerm_subnet" "subnetname" {
  name=var.subnetname
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name

}



resource "azurerm_network_security_group" "Nsg" {
  name                = var.NSG_Name
  location            = var.NSG_Location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }

  
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
subnet_id = data.azurerm_subnet.subnetname.id
network_security_group_id = azurerm_network_security_group.Nsg.id
depends_on = [
  azurerm_network_security_group.Nsg
]
  
}