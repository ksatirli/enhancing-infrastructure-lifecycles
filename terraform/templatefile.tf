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
  filename = "../packer/variables.pkrvars.hcl"
}
