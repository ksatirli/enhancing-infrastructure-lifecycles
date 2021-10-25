# 🔧 WORKSHOP:
# create an Azure Public IP
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

# 🔧 WORKSHOP: give the IP a Terraform ID of "windows"
resource "azurerm_public_ip" "windows" {
  # 🔧 WORKSHOP: set the Allocation Method to "static" (note the capitalization)
  allocation_method   = "Static"

  # 🔧 WORKSHOP: set the Location to be a dynamic reference of the Location of the "Virtual Network" resource
  location = azurerm_virtual_network.converge.location

  # 🔧 WORKSHOP: set the Name to a dynamic reference of the Name of the "Virtual Network" resource
  name = azurerm_virtual_network.converge.name

  # 🔧 WORKSHOP: set the Resource Group Name to be a dynamic reference of the Resource Group Name of the "Virtual Network" resource
  resource_group_name = azurerm_virtual_network.converge.resource_group_name
}
