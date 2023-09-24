# output "public_ip_address" {
#   value = data.azurerm_public_ip.pip.ip_address
# }


output "vm_public_ip" {
  value = [
    for virtual_machine in azurerm_public_ip.pip : virtual_machine.ip_address
  ]
}
