provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  frontendsubnetcidr  = var.frontendsubnetcidr
  backendsubnetcidr  = var.backendsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  frontend_subnet_id  = module.networking.frontendsubnet_id
  backend_subnet_id  = module.networking.backendsubnet_id
  db_subnet_id   = module.networking.dbsubnet_id
}

module "compute" {
  source         = "./modules/compute"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  frontend_subnet_id = module.networking.frontendsubnet_id
  backend_subnet_id = module.networking.backendsubnet_id
  frontend_host_name = var.frontend_host_name
  frontend_username = var.frontend_username
  frontend_os_password = var.frontend_os_password
  backend_host_name = var.backend_host_name
  backend_username = var.backend_username
  backend_os_password = var.backend_os_password
}

module "database" {
  source = "./modules/database"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  primary_database = var.primary_database
  primary_database_version = var.primary_database_version
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
}