# create a random string for use with resources that require randomness
# see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "four" {
  lower   = true
  length  = 4
  special = false
  upper   = false
}

# create an Azure Resource Group for use with Packer
# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "packer" {
  name     = "${var.resource_group_name}-${random_string.four.id}"
  location = var.resource_group_location
}

locals {
  terraform_data = templatefile("./templates/variables.pkrvars.hcl", {
    location                          = azurerm_resource_group.packer.location
    managed_image_resource_group_name = azurerm_resource_group.packer.name
  })
}

# Packer needs to know the Resource Group, so we use the Terraform `templatefile` function
# to render a file in the Packer directory (as opposed to manually defining the value)
# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "terraform_data_for_packer" {
  content = local.terraform_data

  # Packer automatically loads files that end in `*.auto.pkrvars.hcl`
  # see https://www.packer.io/guides/hcl/variables#from-a-file
  filename = "../packer/generated.auto.pkrvars.hcl"
}
