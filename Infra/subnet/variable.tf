variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "virtual_network_name" {
  description = "The name of the vnet"
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}
variable "address_prefixes_subnet" {
  description = "The name of the subnet"
  type        = list(string)
}
