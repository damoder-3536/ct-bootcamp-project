resource "azurerm_network_interface" "NIC" {
  name                = var.NIC
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetname.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.VMIP.id 
  }
}

resource "azurerm_public_ip" "VMIP" {
  name                = var.VMIP
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.VmName
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_F2"
  admin_username      = "damodar"
  admin_password      = "Password@123"
  network_interface_ids = [
    azurerm_network_interface.NIC.id,
  ]

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_id = "/subscriptions/04b46bc5-5e1b-45ed-8d06-1a6eeecddd8a/resourceGroups/dm-resourcegroup/providers/Microsoft.Compute/images/dm-PackerImage"
  
}

data "azurerm_subnet" "subnetname" {
  name = var.subnetname
  virtual_network_name = var.vnet_name
  resource_group_name = var.resource_group_name
}