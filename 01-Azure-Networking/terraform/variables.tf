variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "rg-network-lab"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "EastUS"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet-network-lab"
}

variable "vnet_address_space" {
  description = "Address space for VNet"
  type        = list(string)
  default     = ["10.2.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "subnet-web"
}

variable "subnet_prefix" {
  description = "Subnet Prefix"
  type        = list(string)
  default     = ["10.2.0.0/24"]
}

variable "admin_username" {
  description = "VM Administrator Username"
  type        = string
  default     = "azureadmin"
}

variable "admin_password" {
  description = "VM Administrator Password"
  type        = string
  sensitive   = true
}