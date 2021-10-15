terraform {
  # This section enables storing of Terraform State within Terraform Cloud.
  # To enable this, a (free) Terraform Cloud account is required.
  # See https://learn.hashicorp.com/tutorials/terraform/cloud-sign-up.

  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ksatirli"

    workspaces {
      name = "citrix-converge-2021"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/azurerm/latest
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.81.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/random/latest
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "1.0.9"
}
