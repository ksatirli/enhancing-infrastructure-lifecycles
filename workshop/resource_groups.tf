# 🔧 WORKSHOP:
# create an Azure Resource Group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
#
# 🔧 WORKSHOP: give the Resource Group a Terraform ID of "converge"
resource "azurerm_resource_group" "converge" {
  # 🔧 WORKSHOP: give the Resource Group a Name set through an input variable
  # we will create the input variable in the next step
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#name
  name = var.resource_group_name

  # 🔧 WORKSHOP: give the Resource Group a Location set through an input variable
  # we will create the input variable in the next step
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#location
  location = var.resource_group_location
}
