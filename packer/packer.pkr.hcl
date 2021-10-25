# see https://www.packer.io/docs/templates/hcl_templates/blocks/packer
packer {
  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#version-constraint-syntax
  required_version = ">= 1.7.6"

  # see https://www.packer.io/docs/templates/hcl_templates/blocks/packer#specifying-plugin-requirements
  required_plugins {
    # see https://github.com/hashicorp/packer-plugin-azure/releases/
    azure = {
      version = "1.0.3"
      source  = "github.com/hashicorp/azure"
    }
  }
}
