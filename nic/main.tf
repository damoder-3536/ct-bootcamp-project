data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  # output "subnet_id" {
  #   value = data.azurerm_subnet.subnet_id
  # }
}
data "azurerm_public_ip" "publicip" {
  name                = var.publicip_name
  resource_group_name = var.resource_group_name


}
resource "azurerm_network_interface" "app_interface1" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.publicip.id
  }

  #   depends_on = [
  #     azurerm_virtual_network.kd_vnet,
  #     azurerm_subnet.kd_subnet
  #   ]
}