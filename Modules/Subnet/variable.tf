variable "resource_group_name" {
  type = string
  description = "ResourceGroupName"
}

variable "vnet_name" {
  type = string
  description = "vnet name"
}

variable "address_prefixes" {
    type = list(string)
    description = "Address prefix of Subnet"
  
}

variable "subnetname" {
    type = string
    description = "SubnetName"
  
}