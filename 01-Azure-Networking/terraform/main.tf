resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }

}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_security_rule" "allow_rdp" {

  name = "Allow-RDP"

  priority = 100

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "3389"

  source_address_prefix = "*"

  destination_address_prefix = "*"

  resource_group_name = azurerm_resource_group.rg.name

  network_security_group_name = azurerm_network_security_group.nsg.name
}

#Apply  firewall to this subnet.
resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {

  subnet_id = azurerm_subnet.subnet.id

  network_security_group_id = azurerm_network_security_group.nsg.id
}

#Assign public IP. A Public IP gives your VM an address on the internet.. Make the IP static
resource "azurerm_public_ip" "pip" {

  name = var.public_ip_name

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

  sku = "Standard"

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_interface" "nic" {

  name = var.nic_name

  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {

    name = "internal"

    subnet_id = azurerm_subnet.subnet.id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.pip.id

  }

  tags = {
    Environment = "Lab"
    Project     = "Azure Networking"
    ManagedBy   = "Terraform"
  }
}