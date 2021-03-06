
  # This section enables storing of Terraform State within Terraform Cloud.
  # To enable this, a (free) Terraform Cloud account is required.
  # See https://learn.hashicorp.com/tutorials/terraform/cloud-sign-up.

  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  #backend "remote" {
  #  hostname     = "app.terraform.io"
  #  organization = "a-demo-organization"
  #
  #  workspaces {
  #    name = "citrix-converge-2021"
  #  }
  #}

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements

    # 🔧 WORKSHOP:
    # We will be using three Terraform Providers for this workshop:
    # AzureRM, Local, and Random
    #
    # To ensure our code is reliable, we want to pin their versions.
    # Head to the Terraform Registry and find the three providers.
    # https://registry.terraform.io/browse/providers?tier=official

    # 🔧 WORKSHOP:
    # put code for `azurerm` here
    # see https://registry.terraform.io/providers/hashicorp/azurerm/latest





    # 🔧 WORKSHOP:
    # put code for `local` here
    # see https://registry.terraform.io/providers/hashicorp/local/latest






  # 🔧 WORKSHOP:
  # To ensure our code is reliable, we want to pin the Terraform version to the version you have installed.
  # Run `terraform version` in your CLI, then remember the version string.
  #
  # Next, head to the Terraform documentation to find how to pin Terraform code to a specific version:
  # https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version


