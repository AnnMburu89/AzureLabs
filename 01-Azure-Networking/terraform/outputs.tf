output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "public_ip_name" {
  value = azurerm_public_ip.pip.name
}

output "network_interface_name" {
  value = azurerm_network_interface.nic.name
}

output "network_security_group_name" {
  value = azurerm_network_security_group.nsg.name
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.vm.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
}