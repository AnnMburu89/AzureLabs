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
variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}

variable "vm_size" {
  description = "Azure VM Size"
  type        = string
}

resource "azurerm_windows_virtual_machine" "vm" {

  name                = var.vm_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2019-Datacenter"

    version = "latest"

  }

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }

}