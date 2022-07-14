# Input variable definitions
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
