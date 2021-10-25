# 🔧 WORKSHOP:
# create an Azure Network Interface
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
#
# 🔧 WORKSHOP: give the Azure Network Interface a Terraform ID of "converge"

  # 🔧 WORKSHOP: create the IP Configuration
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_configuration

    # 🔧 WORKSHOP: set the Name to "internal"


    # 🔧 WORKSHOP: set the Subnet ID to a dynamic reference of the ID of the "Subnet" resource


    # 🔧 WORKSHOP: set the Private IP Address Allocation to be dynamic (note the capitalization)


    # 🔧 WORKSHOP: set the Public IP Address ID to be a dynamic reference of the ID of the "Public IP" resource



  # 🔧 WORKSHOP: set the Location to be a dynamic reference of the Location of the "Resource Group" resource


  # 🔧 WORKSHOP: set the Name to be a combination of:
  # * a dynamic reference of the Name of the "Virtual Network" resource
  # * a dash and the word "nic"


  # 🔧 WORKSHOP: set the Resource Group Name to be a dynamic reference of the Name of the "Resource Group" resource

