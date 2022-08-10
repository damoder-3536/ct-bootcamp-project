variable "vnet_name" {
  type        = string
  description = "VNET Name"


}

variable "resource_group_name" {
  type        = string
  description = "RG Name"

}

variable "resource_group_location" {
  type        = string
  description = "RG Loaction"

}

variable "subnetname" {
  type        = string
  description = "SubnetName"
}

variable "NSG_Name" {
  type        = string
  description = "NSG Name"
}

variable "NIC" {
  type    = string
  default = "MyNIC"

}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}

variable "address_prefixes" {
  type        = list(string)
  description = "Address prefix of Subnet"

}

variable "NSG_Location" {
  type        = string
  description = "NSG Loaction"
}

variable "VmName" {
  type    = string
  default = "VirtualMachine"
}

variable "VMIP" {
  type    = string
  default = "VMIP"
}