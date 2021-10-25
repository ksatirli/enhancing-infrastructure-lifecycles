# 🔧 WORKSHOP:
# create an Azure Subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
#
# 🔧 WORKSHOP: give the Azure Subnet a Terraform ID of "converge"
resource "azurerm_subnet" "converge" {
  # 🔧 WORKSHOP: set the Address Prefixes to a list of "10.0.2.0/24"
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#address_prefixes
  address_prefixes = [
    "10.0.2.0/24"
  ]

  # 🔧 WORKSHOP: set the Name to a dynamic reference of the Name of the "Virtual Network" resource
  name = azurerm_virtual_network.converge.name

  # 🔧 WORKSHOP: set the Resource Group Name to a dynamic reference of the Resource Group Name of the "Virtual Network" resource
  resource_group_name = azurerm_virtual_network.converge.resource_group_name

  # 🔧 WORKSHOP: set the Virtual Network Name to a dynamic reference of the Name of the "Virtual Network" resource
  virtual_network_name = azurerm_virtual_network.converge.name
}
