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
  
  description = "The values for each NSG  rule"
}