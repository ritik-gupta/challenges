output "network_name" {
  value = azurerm_virtual_network.vnet01.name
  description = "Name of the Virtual network"
}

output "frontendsubnet_id" {
  value = azurerm_subnet.frontend-subnet.id
  description = "Id of frontend subnet in the network"
}

output "backendsubnet_id" {
  value = azurerm_subnet.backend-subnet.id
  description = "Id of backend subnet in the network"
}

output "dbsubnet_id" {
  value = azurerm_subnet.db-subnet.id
  description = "Id of dbsubnet in the network"
}


