/*
resource "azurerm_network_security_group" "einfosg" {
  name                = "einfo-security-group"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
}

resource "azurerm_virtual_network" "einfovnet" {
  name                = "einfo-network"
  location            = azurerm_resource_group.appgrp.location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "einfo-subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "einfo-subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.einfosg.id
  }



}
*/