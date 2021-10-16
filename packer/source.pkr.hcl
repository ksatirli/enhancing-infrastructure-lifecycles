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

  location = var.location

  # set the values for Image Name and Image Resource Group Name from variables
  # consider if these values make sense for your organization and update as needed
  managed_image_name                = var.managed_image_resource_group_name
  managed_image_resource_group_name = var.managed_image_resource_group_name

  os_type                      = "Linux"
  ssh_clear_authorized_keys    = true
  ssh_disable_agent_forwarding = true

  # authentication with `az` CLI supplied credentials
  # see https://www.packer.io/docs/builders/azure/arm#use_azure_cli_auth
  use_azure_cli_auth = true

  vm_size = var.vm_size
}
