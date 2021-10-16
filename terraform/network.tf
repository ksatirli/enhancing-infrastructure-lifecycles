# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "citrix" {
  name                = azurerm_resource_group.citrix.name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.citrix.location
  resource_group_name = azurerm_resource_group.citrix.name
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "citrix" {
  name                 = azurerm_resource_group.citrix.name
  resource_group_name  = azurerm_resource_group.citrix.name
  virtual_network_name = azurerm_virtual_network.citrix.name

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#address_prefixes
  address_prefixes = [
    "10.0.2.0/24"
  ]
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
resource "azurerm_network_interface" "citrix" {
  name                = azurerm_resource_group.citrix.name
  location            = azurerm_resource_group.citrix.location
  resource_group_name = azurerm_resource_group.citrix.name

  # see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface#ip_configuration
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.citrix.id
    private_ip_address_allocation = "Dynamic"
  }
}