# 🔧 WORKSHOP:
# create an Azure Virtual Network
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
#
# 🔧 WORKSHOP: give the Azure Network Interface a Terraform ID of "converge"
resource "azurerm_virtual_network" "converge" {
  # 🔧 WORKSHOP: set the Address Space to a list of "10.0.0.0/16"
  address_space = [
    "10.0.0.0/16"
  ]

  # 🔧 WORKSHOP: set the Location to a dynamic reference of the Location of the "Resource Group" resource
  location = azurerm_resource_group.converge.location

  # 🔧 WORKSHOP: set the Name to a dynamic reference of the Name of the "Resource Group" resource
  name = azurerm_resource_group.converge.name

  # 🔧 WORKSHOP: set the Resource Group Name to a dynamic reference of the Name of the "Resource Group" resource
  resource_group_name = azurerm_resource_group.converge.name
}
