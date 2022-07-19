module "rg" {
  source              = "./resource_group"
  location            = var.location
  resource_group_name = var.resource_group_name
}
#for Vnet
module "vnet" {
  source               = "./vnet"
  virtual_network_name = var.virtual_network_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  address_space_vnet   = var.address_space_vnet
  dns_servers_vnet     = var.dns_servers_vnet
  depends_on = [
    module.rg
  ]
}
# for Subnet
module "subnet" {
  source                  = "./subnet"
  subnet_name             = var.subnet_name
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.virtual_network_name
  address_prefixes_subnet = var.address_prefixes_subnet
  depends_on = [
    module.rg,
    module.vnet
  ]
}
module "publicip" {
  source              = "./publicIP"
  publicip_name       = var.publicip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [
    module.subnet,
    module.rg,
    module.vnet
  ]
}
module "nic" {
  source                 = "./nic"
  publicip_name          = var.publicip_name
  network_interface_name = var.network_interface_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  subnet_name            = var.subnet_name
  virtual_network_name   = var.virtual_network_name
  depends_on = [
    module.subnet,
    module.publicip
  ]

}
module "vm" {
  source               = "./vm"
  vm_name              = var.vm_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  publicip_name        = var.publicip_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = var.subnet_name
  depends_on = [
    module.subnet,
    module.nic
  ]
}
module "nsg" {
  source                      = "./nsg"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  network_security_group_name = var.network_security_group_name
  virtual_network_name        = var.virtual_network_name
  subnet_name                 = var.subnet_name
  depends_on = [
    module.rg,
    module.subnet,
    module.vnet
  ]
}
