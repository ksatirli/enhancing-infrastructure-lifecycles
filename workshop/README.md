# Workshop

> Learn Terraform by creating a Windows Virtual Machine in Microsoft Azure.

## Table of Contents

- [Workshop](#workshop)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Flow](#flow)
    - [Initialize Terraform](#initialize-terraform)
    - [Configure the AzureRM Provider](#configure-the-azurerm-provider)
    - [Create the Resource Group](#create-the-resource-group)
    - [Create the Network Configuration](#create-the-network-configuration)
    - [Create the Virtual Machine](#create-the-virtual-machine)
    - [Create Output Values](#create-output-values)
    - [Create Remote Desktop Configuration](#create-remote-desktop-configuration)
    - [Connect to the Virtual Machine (optional)](#connect-to-the-virtual-machine-optional)
    - [Remove resources](#remove-resources)
  - [Notes](#notes)

## Requirements

* Software
  * [HashiCorp Terraform](https://www.terraform.io/downloads.html) `1.0.9` or later
  * [HashiCorp Packer](https://www.packer.io/downloads) `1.7.7` or later
  * [Azure Command-Line Interface](https://docs.microsoft.com/en-us/cli/azure/) `2.29.0` or later
  * a code editor such as [VS Code](https://code.visualstudio.com) with support for [HCL files](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

* Services
  * (optional) [Terraform Cloud](https://app.terraform.io/signup/account) (free)
  * [Microsoft Azure](https://azure.microsoft.com/en-us/free/) (free credit)

## Usage

To take part in this workshop, you will need to sequentially edit a handful of files in this directory.

Workshop steps are indicated with a (commented) _wrench_ emoji: `🔧`, followed by an instruction:

```hcl
# 🔧 WORKSHOP: set the Terraform version here
```

### Flow

This section contains the suggested flow for this workshop.

#### Initialize Terraform

* open `terraform.tf` and complete `4` steps
* run `terraform init` in your terminal
* verify your code and run `terraform providers`
* compare the output with the following output:

```shell
Providers required by configuration:
.
├── provider[registry.terraform.io/hashicorp/azurerm] 2.82.0
└── provider[registry.terraform.io/hashicorp/local] 2.1.0
```

#### Configure the AzureRM Provider

* open `providers.tf` and complete `5` steps
* run `terraform plan` in your terminal
* compare the output with the following output:

```shell
No changes. Your infrastructure matches the configuration.
```

#### Create the Resource Group

* open `resource_groups.tf` and complete `4` steps
* open `variables.tf` and complete `2` steps
* run `terraform fmt` in your terminal to format the code
* run `terraform validate` in your terminal to validate the code
* run `terraform apply` in your terminal to apply your changes

#### Create the Network Configuration

* open `network.tf` and complete `6` steps
* open `network_publicip.tf` and complete `6` steps
* open `network_interface.tf` and complete `10` steps
* open `network_subnet.tf` and complete `6` steps
* run `terraform fmt` in your terminal to format the code
* run `terraform validate` in your terminal to validate the code
* run `terraform apply` in your terminal to apply your changes
* compare the output with the following output:

```shell
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

<small>The `4` in the above output refers to the Virtual Network, Subnet, Network Interface, and the Static IP you just created.</small>

#### Create the Virtual Machine

* open `virtual_machine.tf` and complete `17` steps
* run `terraform fmt` in your terminal to format the code
* run `terraform validate` in your terminal to validate the code
* run `terraform apply` in your terminal to apply your changes
* compare the output with the following output:

```shell
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

<small>The `1` in the above output refers to the Windows Virtual Machine you just created.</small>

#### Create Output Values

* open `outputs.tf` and complete `3` steps
* run `terraform apply` in your terminal to apply your changes
* compare the output with the following output:

```shell
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

virtual_machine_public_ip_address = "<Virtual Machine IP Address>"
```

<small>Outputs are not counted as resources in Terraform.</small>

#### Create Remote Desktop Configuration

* open `remote_desktop_connection.tf` and complete `6` steps
* run `terraform apply` in your terminal to apply your changes
* compare the output with the following output:

```shell
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

virtual_machine_public_ip_address = "40.121.23.96"
```

<small>The `1` in the above output refers to the RDP Configuration file you just created.</small>

#### Connect to the Virtual Machine (optional)

* open `converge.rdp` using Microsoft Remote Desktop ([Windows](https://www.microsoft.com/en-us/p/microsoft-remote-desktop/9wzdncrfj3ps#activetab=pivot:overviewtab), [macOS](https://apps.apple.com/us/app/microsoft-remote-desktop/id1295203466?mt=12))
* enter the password you previously set
* click the "Connect" button
* install and play Minesweeper 💣

#### Remove resources

⚠️ Continuing with this step will remove _all_ Terraform-managed resources created in the previous steps.

* run `terraform destroy` in your terminal to destroy all resources
* compare the output with the following output:

```shell
Plan: 0 to add, 0 to change, 6 to destroy.
```

* confirm the destruction by typing `yes`

## Notes

* Many parts of this workshop align with current Terraform best-practices. The resulting resources, however, must _not_ be considered production-grade.
