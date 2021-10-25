# 🔧 WORKSHOP:
# create a string variable for the Resource Group Name
# set a description and a default value of `converge`
# https://www.terraform.io/docs/language/values/variables.html
variable "resource_group_name" {
  type        = string
  description = "The Name which should be used for this Resource Group"
  default     = "converge"
}

# 🔧 WORKSHOP:
# create a string variable for the Resource Group Geographic Location
# set a description and a default value of `eastus` (for Virginia, US)
# https://www.terraform.io/docs/language/values/variables.html
#
# (see https://azure.microsoft.com/en-us/global-infrastructure/geographies/#geographies for other locations)
variable "resource_group_location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist"
  default     = "eastus" # Virginia, US
}
