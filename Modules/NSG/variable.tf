variable "NSG_Name" {
    type = string
    description = "Network security Group" 
}

variable "NSG_Location" {
   type=string
   description = "NSG Location"
}

variable "resource_group_name" {
 type = string
 description = "Resource group location"
  
}

variable "subnetname" {
  type=string
  description="Subnet Name"
}

variable "vnet_name" {
  type=string
  description="Virtual Network Name"
  
}

variable "nsg_rules" {
  description = "The values for each NSG  rule"
  type = list(object({
    name  = string
    priority  = number
    direction = string
    access  = string
    protocol   = string
    source_port_range   = string
    destination_port_range  = string
    source_address_prefix = string
    description_address_prefix = string

  }))
  default = [ {
    access = "Allow"
    description_address_prefix = "*"
    destination_port_range = "*"
    direction = "Inbound"
    name = "Rule01"
    priority = 100
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "80"
  },
  {
    access = "Allow"
    description_address_prefix = "*"
    destination_port_range = "*"
    direction = "Inbound"
    name = "Rule02"
    priority = 110
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "443"
  },
  {
    access = "Allow"
    description_address_prefix = "*"
    destination_port_range = "*"
    direction = "Inbound"
    name = "Rule03"
    priority = 120
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "3389"
  }


  ]
  
  
}