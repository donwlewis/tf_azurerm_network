provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "huckleberry"
  location = "westus2"
}

resource "azurerm_virtual_network" "default" {
  name                = "okcorral"
  location            = "westus2"
  resource_group_name = azurerm_resource_group.default.name
  address_space       = ["10.0.0.0/8"]
}

module "subnets" {
  source               = "./module"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  subnets              = local.subnets
}
