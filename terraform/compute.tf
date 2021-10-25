## see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/image
data "azurerm_image" "converge" {
  name                = local.resource_group_name
  resource_group_name = local.resource_group_name
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
resource "azurerm_linux_virtual_machine" "converge" {
  name                = data.azurerm_image.converge.name
  resource_group_name = data.azurerm_image.converge.resource_group_name
  location            = data.azurerm_image.converge.location
  size                = "Standard_F2"

  admin_username = "adminuser"

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#admin_ssh_key
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#network_interface_ids
  network_interface_ids = [
    azurerm_network_interface.converge.id,
  ]

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#caching
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # The value for `source_image_id` is dynamically retrieved through the data source
  # at the top of this file; this allows for less maintenance and a more robust system
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#source_image_id
  source_image_id = data.azurerm_image.converge.id
}
