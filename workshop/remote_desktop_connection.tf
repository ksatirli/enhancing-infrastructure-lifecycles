# 🔧 WORKSHOP:
# create a Local Value to render a Template File with the Virtual Machine IP
#
# https://www.terraform.io/docs/language/values/locals.html
locals {
  rdp_data = templatefile("./templates/template.rdp", {
    # 🔧 WORKSHOP: set the value of the `public_ip_address` key to the Public IP Address of the "Virtual Machine" resource
    public_ip_address = azurerm_windows_virtual_machine.converge.public_ip_address

    # 🔧 WORKSHOP: set the value of the `username` key to the Admin Username of the "Virtual Machine" resource
    username = azurerm_windows_virtual_machine.converge.admin_username
  })
}

# 🔧 WORKSHOP: render an RDP Configuration file with Terraform
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "remote_desktop_configuration" {
  # 🔧 WORKSHOP: set the content of the file to be the value of the `rdp_data` local from before
  content = local.rdp_data

  # 🔧 WORKSHOP: set the file name to a combination of
  # * a dynamic reference of the Name of the "Virtual Machine" resource
  # * followed by ".rdp"
  filename = "${azurerm_virtual_network.converge.name}.rdp"
}
