resource "azurerm_subnet_route_table_association" "SubnetA_CE_Route_Asso" {
  subnet_id = tolist(azurerm_virtual_network.az_vnet[1].subnet[*].id)[0]
  route_table_id = azurerm_route_table.VnetA_CE_To_VnetA_CC_Route.id
  depends_on = [
    azurerm_route_table.VnetA_CE_To_VnetA_CC_Route, azurerm_virtual_network.az_vnet
  ]
}

resource "azurerm_subnet_route_table_association" "SubnetB_CE_Route_Asso" {
  subnet_id = tolist(azurerm_virtual_network.az_vnet[2].subnet[*].id)[0]
  route_table_id = azurerm_route_table.VnetB_CE_To_VnetA_CC_Route.id
  depends_on = [
    azurerm_virtual_network.az_vnet, azurerm_route_table.VnetB_CE_To_VnetA_CC_Route
  ]
}