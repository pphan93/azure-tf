resource "azurerm_route_table" "VnetA_CE_To_VnetA_CC_Route" {
  name = "VnetA-CE-To-VnetA-CC-Route-Table"
  location = azurerm_virtual_network.az_vnet[1].location
  resource_group_name = azurerm_resource_group.azrg_vnet.name
  disable_bgp_route_propagation = false

  route {
    name = "VnetA-CE-To-VnetA-CC-Route"
    address_prefix = var.vnet_addr_space[2]
    next_hop_type = "VirtualNetworkGateway"
    # next_hop_in_ip_address = azurerm_virtual_network_gateway.az_vnet_gw
  }

}

resource "azurerm_route_table" "VnetB_CE_To_VnetA_CC_Route" {
  name = "VnetB-CE-To-VnetA-CC-Route-Table"
  location = azurerm_virtual_network.az_vnet[2].location
  resource_group_name = azurerm_resource_group.azrg_vnet.name
  disable_bgp_route_propagation = false

  route {
    name = "VnetB-CE-To-VnetA-CC-Route"
    address_prefix = var.vnet_addr_space[1]
    next_hop_type = "VirtualNetworkGateway"
    # next_hop_in_ip_address = azurerm_virtual_network_gateway.az_vnet_gw
  }

}