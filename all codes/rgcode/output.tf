output "rg" {
  value = [
    for rg in azurerm_resource_group.example : rg.id
  ]
}