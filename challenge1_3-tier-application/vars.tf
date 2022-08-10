variable "name" {
    default = "3-tier-azure-stack"
}
variable "location" {
    default = "Central India"
}
variable "vnetcidr" {
    default = "192.165.0.0/16"
}
variable "frontendsubnetcidr" {
    default = "192.165.1.0/24"
}
variable "backendsubnetcidr" {
    default = "192.165.2.0/24"
}
variable "dbsubnetcidr" {
    default = "192.165.3.0/24"
}
variable "frontend_host_name"{
    default = "frontend_server"
}
variable "frontend_username" {
    default = "frontend_user"
}
variable "frontend_os_password" {
    default = "frontenduser@123"
}
variable "backend_host_name"{
    default = "backend_server"
}
variable "backend_username" {
    default = "backend_user"
}
variable "backend_os_password" {
    default = "backenduser@123"
}
variable "primary_database" {
    default = "sql-db"
}
variable "primary_database_admin" {
    default = "sqladmin"
}
variable "primary_database_password" {
    default = "Sqladmin@123"
}