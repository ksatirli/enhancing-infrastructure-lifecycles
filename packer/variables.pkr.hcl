# see https://www.packer.io/docs/builders/azure/arm#image_publisher
variable "image_publisher" {
  type        = string
  description = "(Required) Name of the publisher to use for your base image."
  default     = "Canonical"
}

# see https://www.packer.io/docs/builders/azure/arm#image_offer
variable "image_offer" {
  type        = string
  description = "(Required) Name of the publisher's offer to use for your base image."
  default     = "0001-com-ubuntu-server-focal"
}

# see https://www.packer.io/docs/builders/azure/arm#image_sku
variable "image_sku" {
  type        = string
  description = "(Required) SKU of the image offer to use for your base image."
  default     = "20_04-lts"
}

# see https://www.packer.io/docs/builders/azure/arm#image_version
variable "image_version" {
  type        = string
  description = "Specify a specific version of an OS to boot from."
  default     = "latest"
}

# see https://www.packer.io/docs/builders/azure/arm#location
variable "location" {
  type        = string
  description = "Azure datacenter in which your VM will build."
}

# see https://www.packer.io/docs/builders/azure/arm#managed_image_resource_group_name
variable "managed_image_resource_group_name" {
  type        = string
  description = "Resource group under which the final artifact will be stored."

  # The default for this is specified in `./generated.auto.pkrvars.hcl`
}

# see https://www.packer.io/docs/builders/azure/arm#vm_size
variable "vm_size" {
  type        = string
  description = "Size of the VM used for building."
  default     = "Standard_A1"
}
