# Input variable definitions
variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "virtual_network_name" {
  description = "The name of the vnet"
  type        = string
}
variable "network_security_group_name" {
  description = "The name of the subnet"
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

# variable "subnet_id" {
#   description = "The name of the subnet"
#   type        = string
# }