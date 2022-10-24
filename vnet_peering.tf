resource "azurerm_virtual_network_peering" "VnetA_CE_To_VnetA_CC_Peer" {
    name = "peerVnetACEtoVnetACC"
    resource_group_name = azurerm_resource_group.azrg_vnet.name
    virtual_network_name = azurerm_virtual_network.az_vnet[1].name
    remote_virtual_network_id = azurerm_virtual_network.az_vnet[0].id
    use_remote_gateways = true
    allow_forwarded_traffic = true
    depends_on = [
      azurerm_virtual_network_peering.VnetA_CC_To_VnetA_CE_Peer, azurerm_virtual_network_gateway.az_vnet_gw
    ]
}

resource "azurerm_virtual_network_peering" "VnetA_CC_To_VnetA_CE_Peer" {
    name = "peerVnetACCtoVnetACE"
    resource_group_name = azurerm_resource_group.azrg_vnet.name
    virtual_network_name = azurerm_virtual_network.az_vnet[0].name
    remote_virtual_network_id = azurerm_virtual_network.az_vnet[1].id
    use_remote_gateways = false
    allow_forwarded_traffic = true
    allow_gateway_transit = true
    depends_on = [
      azurerm_virtual_network_gateway.az_vnet_gw
    ]
}

resource "azurerm_virtual_network_peering" "VnetB_CE_To_VnetA_CC_Peer" {
    name = "peerVnetBCEtoVnetACC"
    resource_group_name = azurerm_resource_group.azrg_vnet.name
    virtual_network_name = azurerm_virtual_network.az_vnet[2].name
    remote_virtual_network_id = azurerm_virtual_network.az_vnet[0].id
    use_remote_gateways = true
    allow_forwarded_traffic = true
    depends_on = [
      azurerm_virtual_network_peering.VnetA_CC_To_VnetB_CE_Peer, azurerm_virtual_network_gateway.az_vnet_gw
    ]
}

resource "azurerm_virtual_network_peering" "VnetA_CC_To_VnetB_CE_Peer" {
    name = "peerVnetACCtoVnetBCE"
    resource_group_name = azurerm_resource_group.azrg_vnet.name
    virtual_network_name = azurerm_virtual_network.az_vnet[0].name
    remote_virtual_network_id = azurerm_virtual_network.az_vnet[2].id
    use_remote_gateways = false
    allow_forwarded_traffic = true
    allow_gateway_transit = true
    depends_on = [
      azurerm_virtual_network_gateway.az_vnet_gw
    ]
}