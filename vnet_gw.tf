resource "azurerm_public_ip" "az_vnet_gw_public_ip" {
    name = "VNet-A-WestUS-GW-IP"
    location = azurerm_resource_group.azrg_vnet.location
    resource_group_name = azurerm_resource_group.azrg_vnet.name
    allocation_method = "Dynamic"
    # sku = "Standard"
}

resource "azurerm_subnet" "az_vnet_A_gw_subnet_CanadaCentral" {
  name = "GatewaySubnet"
  resource_group_name = azurerm_resource_group.azrg_vnet.name
  virtual_network_name = azurerm_virtual_network.az_vnet[0].name
  address_prefixes = ["10.3.1.0/24"]
}

resource "azurerm_virtual_network_gateway" "az_vnet_gw" {
  name = "VNet-A-CanadaCentral-GW"
  location = azurerm_resource_group.azrg_vnet.location
  resource_group_name = azurerm_resource_group.azrg_vnet.name

  type = "Vpn"
  vpn_type = "RouteBased"
  sku = "VpnGw1"
  # private_ip_address_enabled = true

  ip_configuration {
    name = "VNet-A-CanadaCentral-GW-IP"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.az_vnet_gw_public_ip.id
    subnet_id = azurerm_subnet.az_vnet_A_gw_subnet_CanadaCentral.id
  }

  depends_on = [
    azurerm_public_ip.az_vnet_gw_public_ip
  ]
}

output "gateway" {
  value = azurerm_virtual_network_gateway.az_vnet_gw
}