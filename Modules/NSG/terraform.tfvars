NSG_Name="DMNSG"
NSG_Location="CentralIndia"
resource_group_name="dm-rg"
subnetname="Subnet1"
vnet_name="dm-vnet"
nsg_rules = [ {
  access = "Allow"
  description_address_prefix = "*"
  destination_port_range = "80"
  direction = "Inbound"
  name = "Rule01"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = "*"
  source_port_range = "*"
},
 {
  access = "Allow"
  description_address_prefix = "*"
  destination_port_range = "443"
  direction = "Inbound"
  name = "Rule02"
  priority = 110
  protocol = "Tcp"
  source_address_prefix = "*"
  source_port_range = "*"
 },
  {
  access = "Allow"
  description_address_prefix = "*"
  destination_port_range = "3389"
  direction = "Inbound"
  name = "Rule03"
  priority = 120
  protocol = "RDP"
  source_address_prefix = "*"
  source_port_range = "*"
  }
]