data "azurerm_subnet" "subnetname" {
  name=var.subnetname
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name

}



resource "azurerm_network_security_group" "Nsg" {
  name                = var.NSG_Name
  location            = var.NSG_Location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content{
     name                       = security_rule.value["name"]
     priority                   = security_rule.value["priority"]
     direction                  = security_rule.value["direction"]
     access                     = security_rule.value["access"]
     protocol                   = security_rule.value["protocol"]
     source_port_range          = security_rule.value["source_port_range"]
     destination_port_range     = security_rule.value["destination_port_range"]
     source_address_prefix      = "*"
     destination_address_prefix = "*"
    }
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