variable "resource_group_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
  default     = "citrix-converge"
}

# set a geographic location for the Resource Group
# see https://azure.microsoft.com/en-us/global-infrastructure/geographies/#geographies
# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#location
variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist"
  default     = "eastus" # Virginia, US
}

locals {
  # generate unique Resource Group Name by appending a random string
  resource_group_name = "${var.resource_group_name}-${random_string.four.id}"
}