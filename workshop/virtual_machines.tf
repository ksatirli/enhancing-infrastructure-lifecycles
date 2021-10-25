# 🔧 WORKSHOP:
# create an Azure Windows Virtual Machine
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine
#
# 🔧 WORKSHOP: give the Virtual Machine a Terraform ID of "converge"
resource "azurerm_windows_virtual_machine" "converge" {
  # 🔧 WORKSHOP: set the Location to be a dynamic reference of the Location of the "Virtual Network" resource
  location = azurerm_virtual_network.converge.location

  # 🔧 WORKSHOP: set the Name to a dynamic reference of the Name of the "Virtual Network" resource
  name = azurerm_virtual_network.converge.name

  # 🔧 WORKSHOP: set the Resource Group Name to be a dynamic reference of the Resource Group Name of the "Network Interface" resource
  resource_group_name = azurerm_network_interface.converge.resource_group_name

  # 🔧 WORKSHOP: set the Size of the Virtual Machine to "Standard_F2"
  size = "Standard_F2"

  # 🔧 WORKSHOP: set the Admin Username of the Virtual Machine to "adminuser"
  admin_username = "adminuser"

  # 🔧 WORKSHOP: set the Admin Password of the Virtual Machine to "RichardsonTX,1989!"
  admin_password = "RichardsonTX,1989!"

  # 🔧 WORKSHOP: set the Network Interface IDs list to a reference of the ID of the "Network Interface" resource
  network_interface_ids = [
    azurerm_network_interface.converge.id
  ]

  # 🔧 WORKSHOP: set the OS Disk configuration
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#caching
  os_disk {
    # 🔧 WORKSHOP: set Caching to support read and write
    caching = "ReadWrite"

    # 🔧 WORKSHOP: set the Storage Account Type to Longterm Redundant Storage (LRS)
    storage_account_type = "Standard_LRS"
  }

  # 🔧 WORKSHOP: set the Source Image Reference
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#publisher
  source_image_reference {
    # 🔧 WORKSHOP: set the Publisher to "MicrosoftWindowsServer"
    publisher = "MicrosoftWindowsServer"

    # 🔧 WORKSHOP: set the Offer to "WindowsServer"
    offer = "WindowsServer"

    # 🔧 WORKSHOP: set the SKU to "2019-Datacenter"
    sku = "2019-Datacenter"

    # 🔧 WORKSHOP: set the Version to "latest"
    version = "latest"
  }
}
