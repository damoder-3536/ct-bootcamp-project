NSG_Name="DMNSG"
NSG_Location="CentralIndia"
resource_group_name="dm-rg"
subnetname="Subnet1"
vnet_name="dm-vnet"
nsg_rules = [ {
  access = "Allow"
  description_address_prefix = "*"
  destination_port_range = "*"
  direction = "Inbound"
  name = "AllowWe"
  priority = 100
  protocol = "TCP"
  source_address_prefix = "*"
  source_port_range = "*"
} ]