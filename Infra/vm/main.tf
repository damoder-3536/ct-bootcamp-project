data "azurerm_network_interface" "nic" {
  name = var.network_interface_name
  # location            = var.location
  resource_group_name = var.resource_group_name
}
data "azurerm_image" "image" {
  name                = "packer-image"
  resource_group_name = "kd-packer-rg"
}
resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = "P@$$w0rd1234!"
  network_interface_ids = [data.azurerm_network_interface.nic.id]
  source_image_id       = data.azurerm_image.image.id
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}