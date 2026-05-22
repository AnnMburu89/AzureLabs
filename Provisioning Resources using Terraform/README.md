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

