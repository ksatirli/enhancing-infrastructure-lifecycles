# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "converge" {
  name = azurerm_resource_group.converge.name

  address_space = [
    "10.0.0.0/16"
  ]

  location            = azurerm_resource_group.converge.location
  resource_group_name = azurerm_resource_group.converge.name
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "converge" {
  name                 = azurerm_resource_group.converge.name
  resource_group_name  = azurerm_resource_group.converge.name
  virtual_network_name = azurerm_virtual_network.converge.name

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#address_prefixes
  address_prefixes = [
    "10.0.2.0/24"
  ]
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
resource "azurerm_network_interface" "converge" {
  name                = azurerm_resource_group.converge.name
  location            = azurerm_resource_group.converge.location
  resource_group_name = azurerm_resource_group.converge.name

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_configuration
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.converge.id
    private_ip_address_allocation = "Dynamic"
  }
}
