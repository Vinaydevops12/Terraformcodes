resource "azurerm_virtual_network_peering" "peering-vnet" {
  for_each                  = var.vnet_peering
  name                      = each.value.name
  resource_group_name       = each.value.rgname
  virtual_network_name      = each.value.vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.vnetid[each.key].id
}



data "azurerm_virtual_network" "vnetid" {
  for_each            = var.vnet_peering
  name                = each.value.vnetname_local
  resource_group_name = each.value.rgname_local
}

