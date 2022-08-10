resource "azurerm_availability_set" "frontend_availabilty_set" {
  name                = "frontend_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_network_interface" "frontend_net_interface" {
    name = "frontend_network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "frontend-server"
        subnet_id = var.frontend_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "frontend_vm" {
  name = "frontend_vm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.frontend_net_interface.id ]
  availability_set_id = azurerm_availability_set.frontend_availabilty_set.id
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "frontend-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.frontend_host_name
    admin_username = var.frontend_username
    admin_password = var.frontend_os_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
  
resource "azurerm_availability_set" "backend_availabilty_set" {
  name                = "backend_availabilty_set"
  location            = var.location
  resource_group_name = var.resource_group
 }

resource "azurerm_network_interface" "backend_net_interface" {
    name = "backend-network"
    resource_group_name = var.resource_group
    location = var.location

    ip_configuration{
        name = "backend-server"
        subnet_id = var.backend_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "backend_vm" {
  name = "backend_vm"
  location = var.location
  resource_group_name = var.resource_group
  network_interface_ids = [ azurerm_network_interface.backend_net_interface.id ]
  availability_set_id = azurerm_availability_set.backend_availabilty_set.id
  vm_size = "Standard_D2s_v3"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "backend-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = var.backend_host_name
    admin_username = var.backend_username
    admin_password = var.backend_os_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}