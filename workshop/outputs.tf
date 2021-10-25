# 🔧 WORKSHOP:
# create Output Values to display information from the Virtual Machine
#
# https://www.terraform.io/docs/language/values/outputs.html

# 🔧 WORKSHOP: create an Output with the Public IP Address of the "Virtual Machine" resource
output "virtual_machine_public_ip_address" {
  # 🔧 WORKSHOP: set the value of the Output to the Public IP Address of the "Virtual Machine" resource
  value = azurerm_windows_virtual_machine.converge.public_ip_address
}
