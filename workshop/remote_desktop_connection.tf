# 🔧 WORKSHOP:
# create a Local Value to render a Template File with the Virtual Machine IP
#
# https://www.terraform.io/docs/language/values/locals.html


    # 🔧 WORKSHOP: set the value of the `public_ip_address` key to the Public IP Address of the "Virtual Machine" resource


    # 🔧 WORKSHOP: set the value of the `username` key to the Admin Username of the "Virtual Machine" resource




# 🔧 WORKSHOP: render an RDP Configuration file with Terraform
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

  # 🔧 WORKSHOP: set the content of the file to be the value of the `rdp_data` local from before


  # 🔧 WORKSHOP: set the filename to a combination of
  # * a dynamic reference of the Name of the "Virtual Machine" resource
  # * followed by ".rdp"


