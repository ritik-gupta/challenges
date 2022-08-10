resource "azurerm_virtual_network" "vnet01" {
  name                = "vnet01"
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = [var.vnetcidr]
}

resource "azurerm_subnet" "frontend-subnet" {
  name                 = "frontend-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.frontendsubnetcidr]
}

resource "azurerm_subnet" "backend-subnet" {
  name                 = "backend-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.backendsubnetcidr]
}

resource "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = azurerm_virtual_network.vnet01.name
  resource_group_name  = var.resource_group
  address_prefixes     = [var.dbsubnetcidr]
}
