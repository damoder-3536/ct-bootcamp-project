module "RG" {
  source                  = "./modules/RG"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}


module "VNET" {
  source                  = "./modules/VNET"
  vnet_name               = var.vnet_name
  address_space           = var.address_space
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  depends_on              = [module.RG]
}

module "Subnet" {
  source              = "./modules/Subnet"
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  address_prefixes    = var.address_prefixes
  subnetname          = var.subnetname

  depends_on = [
    module.VNET
  ]
}

module "NSG" {
  source              = "./modules/NSG"
  NSG_Name            = var.NSG_Name
  NSG_Location        = var.NSG_Location
  resource_group_name = var.resource_group_name
  subnetname          = var.subnetname
  vnet_name           = var.vnet_name

  depends_on = [
    module.Subnet,
    module.VNET
  ]
}


module "VM" {
  source                  = "./modules/VM"
  NIC                     = var.NIC
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  VmName                  = var.VmName
  VMIP                    = var.VMIP
  vnet_name               = var.vnet_name
  subnetname              = var.subnetname
  depends_on = [
    module.VNET, module.Subnet, module.RG
  ]
}