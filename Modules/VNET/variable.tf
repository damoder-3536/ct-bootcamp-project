variable "vnet_name" {
  type = string
  description = "virtual network name"
  
}

variable "address_space" {
    type = list(string)
    description = "The address space that is used by the virtual network."
}

variable "resource_group_name" {
type = string
description = "RG Name"
}

variable "resource_group_location" {
  type=string
  description="Location"
}