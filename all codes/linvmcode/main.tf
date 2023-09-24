data "azurerm_subnet" "example-3" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet
  resource_group_name  = var.rgname
}

resource "azurerm_public_ip" "pip" {
  for_each = var.virtual_machine
  name                = each.value.public_ip
  resource_group_name = var.rgname
  location            = each.value.location
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "linxnic" {
    for_each = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example-3.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "linxvm" {
  for_each = var.virtual_machine
  name                = each.value.linuxvm_name
  resource_group_name = var.rgname
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [
    azurerm_network_interface.linxnic[each.key].id
  ]
disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}