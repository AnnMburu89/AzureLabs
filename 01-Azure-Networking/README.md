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



Created Network Security Group (NSG)

NSG is used as the firewall where you can apply rules to block or allow access eg allow RDP on port 3389



I also configured NIC for the VM. An Azure Virtual Machine doesn't connect directly to a Virtual Network because Azure uses a Network Interface (NIC) as the connection point between the VM and the network. The NIC is attached to the VM and connects it to a subnet within the Virtual Network. It also manages the VM's private IP address, can be associated with a Public IP, and is where network security policies can be applied. It's similar to a physical network card and Ethernet cable in a traditional computer.



Deploy the Virtual Machine

Azure needs to know:



Which Resource Group?

Which Region?

Which Network Interface?

What VM Size?

Which Operating System?

Administrator Username?

Administrator Password?

Which Disk Type?







A Windows Server 2019 Virtual Machine was deployed using Terraform and connected to the Azure Virtual Network through a Network Interface.





\- VM Size: Standard\_B1s

\- OS: Windows Server 2019 Datacenter

\- Authentication: Username/Password

\- Storage: Standard SSD (LRS)





\## CI Pipeline (GitHub Actions)



This project includes a GitHub Actions workflow that automatically validates the Terraform code whenever changes are pushed to the repository.



\### Workflow



Git Push

&#x20;   ↓

Checkout Repository

&#x20;   ↓

Terraform Init

&#x20;   ↓

Terraform Format Check

&#x20;   ↓

Terraform Validate

