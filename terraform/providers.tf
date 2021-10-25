# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
provider "azurerm" {
  features {
    virtual_machine {
      # configure Virtual Machines to not delete the OS disk on deletion of the Virtual Machine
      delete_os_disk_on_deletion = false

      # configure Virtual Machines for a graceful shutdown
      graceful_shutdown = true
    }
  }

  # authentication is handled transparently via `az login`
  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli#logging-into-the-azure-cli
}
