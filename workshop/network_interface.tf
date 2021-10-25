# 🔧 WORKSHOP:
# create an Azure Network Interface
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
#
# 🔧 WORKSHOP: give the Azure Network Interface a Terraform ID of "converge"
resource "azurerm_network_interface" "converge" {
  # 🔧 WORKSHOP: create the IP Configuration
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_configuration
  ip_configuration {
    # 🔧 WORKSHOP: set the Name to "internal"
    name = "internal"

    # 🔧 WORKSHOP: set the Subnet ID to a dynamic reference of the ID of the "Subnet" resource
    subnet_id = azurerm_subnet.converge.id

    # 🔧 WORKSHOP: set the Private IP Address Allocation to be dynamic (note the capitalization)
    private_ip_address_allocation = "Dynamic"
  }

  # 🔧 WORKSHOP: set the Location to be a dynamic reference of the Location of the "Resource Group" resource
  location = azurerm_resource_group.converge.location

  # 🔧 WORKSHOP: set the Name to be a combination of:
  # * a dynamic reference of the Name of the "Virtual Network" resource
  # * a dash and the word "nic"
  name = "${azurerm_virtual_network.converge.name}-nic"

  # 🔧 WORKSHOP: set the Resource Group Name to be a dynamic reference of the Name of the "Resource Group" resource
  resource_group_name = azurerm_resource_group.converge.name
}
