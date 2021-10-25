# 🔧 WORKSHOP:
# create an Azure Windows Virtual Machine
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine
#
# 🔧 WORKSHOP: give the Virtual Machine a Terraform ID of "converge"

  # 🔧 WORKSHOP: set the Location to be a dynamic reference of the Location of the "Virtual Network" resource


  # 🔧 WORKSHOP: set the Name to a dynamic reference of the Name of the "Virtual Network" resource


  # 🔧 WORKSHOP: set the Resource Group Name to be a dynamic reference of the Resource Group Name of the "Network Interface" resource


  # 🔧 WORKSHOP: set the Size of the Virtual Machine to "Standard_F2"


  # 🔧 WORKSHOP: set the Admin Username of the Virtual Machine to "adminuser"


  # 🔧 WORKSHOP: set the Admin Password of the Virtual Machine to "RichardsonTX,1989!"


  # 🔧 WORKSHOP: set the Network Interface IDs list to a reference of the ID of the "Network Interface" resource




  # 🔧 WORKSHOP: set the OS Disk configuration
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#caching

    # 🔧 WORKSHOP: set Caching to support read and write


    # 🔧 WORKSHOP: set the Storage Account Type to Longterm Redundant Storage (LRS)



  # 🔧 WORKSHOP: set the Source Image Reference
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#publisher

    # 🔧 WORKSHOP: set the Publisher to "MicrosoftWindowsServer"


    # 🔧 WORKSHOP: set the Offer to "WindowsServer"


    # 🔧 WORKSHOP: set the SKU to "2019-Datacenter"


    # 🔧 WORKSHOP: set the Version to "latest"



