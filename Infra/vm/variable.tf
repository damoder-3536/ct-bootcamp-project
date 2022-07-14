variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default     = "Central India"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "kd-module-assign"
}
variable "virtual_network_name" {
  description = "The name of the vnet"
  type        = string
  default     = "kd_vnet"
}
variable "network_security_group_name" {
  description = "The name of the subnet"
  type        = string
  default     = "kd_nsg"
}
variable "address_space_vnet" {
  description = "The name of the subnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "dns_servers_vnet" {
  description = "The name of the subnet"
  type        = list(string)
  default     = ["10.0.0.4"] #"10.0.0.5"]
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "kd_module_subnet"
}
variable "address_prefixes_subnet" {
  description = "The name of the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
variable "network_interface_name" {
  description = "The name of the subnet"
  type        = string
  default     = "vm_nic_1"
}
variable "publicip_name" {
  description = "The name of the subnet"
  type        = string
  default     = "LB_PublicIP"
}
variable "allocation_method_publicip" {
  description = "The name of the subnet"
  type        = string
  default     = "Static"
}
variable "vm_name" {
  description = "The name of the subnet"
  type        = string
  default     = "winvmss"
}
variable "lb_name" {
  description = "The name of the subnet"
  type        = string
  default     = "LB"
}
variable "saname" {
  type    = string
  default = "appstore1"
}
# variable "subnet_id" {
#   description = "The name of the subnet"
#   type        = string
# }