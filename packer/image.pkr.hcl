packer {
  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#version-constraint-syntax
  required_version = ">= 1.7.6"

  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#specifying-plugin-requirements
  required_plugins {
    # see https://github.com/hashicorp/packer-plugin-azure/releases/
    azure = {
      version = "1.0.3"
      source  = "github.com/hashicorp/azure"
    }
  }
}

# see https://www.packer.io/docs/builders/azure/arm
source "azure-arm" "image" {
  # the following configuration represents a curated variable selection
  # for all options see: https://www.packer.io/docs/builders/azure/arm

  communicator = "ssh"

  # A list of possible values can be retrieved by using the `az` CLI:
  # `az vm image list-offers --location "westus" --publisher Canonical | jq ".[].name"`
  image_offer     = var.image_offer
  image_publisher = var.image_publisher
  image_sku       = var.image_sku
  image_version   = var.image_version

  location                          = var.location
  managed_image_name                = "citrix-converge"
  managed_image_resource_group_name = var.managed_image_resource_group_name
  os_type                           = "Linux"
  ssh_clear_authorized_keys         = true
  ssh_disable_agent_forwarding      = true

  # authentication with `az` CLI supplied credentials
  # see https://www.packer.io/docs/builders/azure/arm#use_azure_cli_auth
  use_azure_cli_auth = true

  vm_size = var.vm_size
}

build {
  name = "provisioners"

  sources = [
    "source.azure-arm.image"
  ]

  # carry out deprovisioning steps: https://www.packer.io/docs/builders/azure/arm#linux
  # for information on the Azure Linux Guest Agent, see https://github.com/Azure/WALinuxAgent
  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"

    inline = [
      "/usr/sbin/waagent -force -deprovision+user",
      "sync"
    ]

    inline_shebang = "/bin/sh -x"
  }
}
