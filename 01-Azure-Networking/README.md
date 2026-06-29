\# Azure Networking Lab



\## Objective



Provision a secure Azure networking environment and deploy a Windows Virtual Machine using Terraform.



\---



\## Technologies Used



\- Microsoft Azure

\- Terraform

\- Azure CLI

\- Visual Studio Code



\---



\## Architecture Diagram



&#x20;                   Azure Subscription

&#x20;                          │

&#x20;                          ▼

&#x20;                   Resource Group

&#x20;                          │

&#x20;                          ▼

&#x20;                   Virtual Network

&#x20;                   10.2.0.0/16

&#x20;                          │

&#x20;                          ▼

&#x20;                 Subnet (10.2.0.0/24)

&#x20;                          │

&#x20;                          ▼

&#x20;            Network Security Group (NSG)

&#x20;                          │

&#x20;                          ▼

&#x20;                 Network Interface (NIC)

&#x20;                          │

&#x20;                ┌─────────┴─────────┐

&#x20;                ▼                   ▼

&#x20;            Public IP         Private IP

&#x20;                │

&#x20;                ▼

&#x20;          Windows Server VM

\---



\## Useful Commands



terraform init -> Initializes a working directory containing Terraform configuration files. It is the absolute first command you must run after writing a new configuration or cloning an existing one from version control. Without running it, subsequent commands like terraform plan and terraform apply will fail.

terraform fmt -> 

terraform validate-> Verifies whether a directory's Terraform configuration files are syntactically valid and internally consistent. Catches missing brackets, commas, quotes, or typos in the HashiCorp Configuration Language (HCL) syntax.

terraform plan -> Creates an execution plan, serving as a dry-run and safety preview of the exact changes Terraform will make to your cloud or on-premises infrastructure

terraform apply -> Execute the actions proposed in a Terraform plan i.e. to create, update, or delete real-world infrastructure





\## Verification



The deployment was verified in the Azure Portal.



\### Resources Successfully Created



\- Resource Group

\- Virtual Network

\- Subnet



The infrastructure was also validated using Terraform outputs.



\## Screenshots



\### Terraform init



!\[Terraform init](images/00-terraform-init.png)





\### Terraform validate



!\[Terraform validate](images/01-terraform-validate.png)



\### Terraform Plan



!\[Terraform Plan](images/02-terraform-plan.png)



\### Terraform Apply



!\[Terraform Apply](images/03-terraform-apply.png)



\### Resource Group



!\[Resource Group](images/05-Azure-ResourceGroup.png)



\### Virtual Network



!\[Virtual Network](images/04-AzureVnet-Subnet.png)





