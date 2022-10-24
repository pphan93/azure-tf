resource "azurerm_virtual_network" "az_vnet" {
  name                = var.vnet_name[count.index]
  location            = var.vnet_location[count.index]
  resource_group_name = azurerm_resource_group.azrg_vnet.name
  address_space       = [var.vnet_addr_space[count.index]]
  count = 3

  subnet {
    name            = "default"
    address_prefix = var.vnet_addr_prefix[count.index]
  }
}

output "vnet" {
  value = tolist(azurerm_virtual_network.az_vnet[1].subnet[*].id)[0]
}