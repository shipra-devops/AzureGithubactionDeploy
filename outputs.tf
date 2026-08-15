output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.rg.name
}

output "vm_details" {
  description = "Details of deployed Virtual Machines."
  value = {
    for i in range(var.vm_count) :
    azurerm_linux_virtual_machine.vm[i].name => {
      id         = azurerm_linux_virtual_machine.vm[i].id
      private_ip = azurerm_network_interface.nic[i].private_ip_address
      public_ip  = azurerm_public_ip.pip[i].ip_address
    }
  }
}

output "ssh_private_key_pem" {
  description = "Generated SSH private key PEM for accessing VMs."
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

output "ssh_command_examples" {
  description = "Example commands to SSH into the deployed VMs."
  value = [
    for i in range(var.vm_count) :
    "ssh -i private_key.pem ${var.admin_username}@${azurerm_public_ip.pip[i].ip_address}"
  ]
}
