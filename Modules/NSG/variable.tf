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