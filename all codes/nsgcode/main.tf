
resource "azurerm_network_security_group" "NSG" {
  name                = var.nsg
  location            = var.location
  resource_group_name = var.rgname

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgassociate" {
  subnet_id                 = data.azurerm_subnet.example-3.id
  network_security_group_id = azurerm_network_security_group.NSG.id
}


data "azurerm_subnet" "example-3" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet
  resource_group_name  = var.rgname
}