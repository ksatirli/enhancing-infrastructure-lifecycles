# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine
resource "azurerm_windows_virtual_machine" "converge" {
  location            = azurerm_virtual_network.converge.location
  name                = azurerm_virtual_network.converge.name
  resource_group_name = azurerm_network_interface.converge.resource_group_name
  size                = "Standard_F2"

  admin_username = "adminuser"
  admin_password = "RichardsonTX,1989!"

  network_interface_ids = [
    azurerm_network_interface.converge.id
  ]

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#caching
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#publisher
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
