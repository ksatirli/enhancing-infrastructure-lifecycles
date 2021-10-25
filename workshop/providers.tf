# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  # 🔧 WORKSHOP:
  # configure the Features block of the AzureRM provider
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features

  # 🔧 WORKSHOP: put features block here
  features {
    # 🔧 WORKSHOP:
    # configure the Virtual Machine block of the Features block
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#virtual_machine

    # 🔧 WORKSHOP: put the Virtual Machine block here
    virtual_machine {

      # 🔧 WORKSHOP:
      # configure Virtual Machines to not delete the OS disk on deletion of the Virtual Machine
      delete_os_disk_on_deletion = false

      # 🔧 WORKSHOP:
      # configure Virtual Machines for a graceful shutdown
      graceful_shutdown = true
    }
  }

  # authentication is handled transparently via `az login`
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#logging-into-the-azure-cli
}
