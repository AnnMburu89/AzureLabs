Azure Virtual Network(Vnet) is the foundational block for your private network in Azure. It provides a logical isolated secure environment where the Azure resources like Vms, Databases can connect to each other, internet or on premise network.



Think of Azure Virtual Network as the traditional corporate network, but now existing on the Azure cloud environment.



Azure Vnet can be subdivided into smaller networks (subnets) to segregate applications.





I created a VM named testPC using Terraform. The script is referencing some resources on main.tf





resource "azurerm\_virtual\_network" "terravnetdemo" {

&#x20; name                = "TerraVnet"

&#x20; address\_space       = \["10.2.0.0/16"]

&#x20; location            = azurerm\_resource\_group.resource\_group.location

&#x20; resource\_group\_name = azurerm\_resource\_group.resource\_group.name

}



resource "azurerm\_subnet" "terrasubnetdemo" {

&#x20; name                 = "internal"

&#x20; resource\_group\_name  = azurerm\_resource\_group.resource\_group.name

&#x20; virtual\_network\_name = azurerm\_virtual\_network.terravnetdemo.name

&#x20; address\_prefixes     = \["10.2.0.0/24"]

}



resource "azurerm\_network\_interface" "terranicdemo" {

&#x20; name                = "demo-nic"

&#x20; location            = azurerm\_resource\_group.resource\_group.location

&#x20; resource\_group\_name = azurerm\_resource\_group.resource\_group.name



&#x20; ip\_configuration {

&#x20;   name                          = "internal"

&#x20;   subnet\_id                     = azurerm\_subnet.terrasubnetdemo.id

&#x20;   private\_ip\_address\_allocation = "Dynamic"

&#x20; }

}



resource "azurerm\_windows\_virtual\_machine" "demovm" {

&#x20; name                = "testPC"

&#x20; resource\_group\_name = azurerm\_resource\_group.resource\_group.name

&#x20; location            = azurerm\_resource\_group.resource\_group.location

&#x20; size                = "Standard\_B1s"

&#x20; admin\_username      = "adminuser"

&#x20; admin\_password      = "P@$$w0rd1234!"

&#x20; network\_interface\_ids = \[

&#x20;   azurerm\_network\_interface.terranicdemo.id,

&#x20; ]



&#x20; os\_disk {

&#x20;   caching              = "ReadWrite"

&#x20;   storage\_account\_type = "Standard\_LRS"

&#x20; }



&#x20; source\_image\_reference {

&#x20;   publisher = "MicrosoftWindowsServer"

&#x20;   offer     = "WindowsServer"

&#x20;   sku       = "2019-Datacenter"

&#x20;   version   = "latest"

&#x20; }

}



