Terraform is imperative. It uses Terraform state file to know details of the environment



Terraform > Terraform Provider > Target API



Terraform providers can be different eg Azurerm for Azure



You can find resources on how to use Azurerm here: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage\_account



Prerequisites

Install:

Azure CLI: To authenticate to Azure

Terraform: To manage Azure resources

VS Code: To manage Terraform code





Before you can execute Azure CLI commands, you must sign in to Azure using Az login

eg az login --tenant 8ad054c6-4dd6-xxxxx



Check Azure Cli version using az version

You can install Terraform extension as it's quite helpful



Create a folder on your desktop > create a document named main.tf



Open the main.tf on VS code





provider "azurerm" {

features {}

}



\#Create aresource group

resource "azurerm\_resource\_group" "resource\_group" {

&#x20; name     = "terraformRG"

&#x20; location = "eastus"

}



\#Create Storage Account

resource "azurerm\_storage\_account" "storage\_account" {

&#x20; name                     = "terraformnatjedemo"

&#x20; resource\_group\_name      = azurerm\_resource\_group.resource\_group.name

&#x20; location                 = azurerm\_resource\_group.resource\_group.location

&#x20; account\_tier             = "Standard"

&#x20; account\_replication\_type = "LRS"

}



Create another .f file called vm.tf which we can use to deploy a windows VM



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





