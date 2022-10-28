module "nginx_vm" {
  source = "./modules/vm"
  item_count = 2
  subnet_id = [tolist(azurerm_virtual_network.az_vnet[1].subnet[*].id)[0], tolist(azurerm_virtual_network.az_vnet[2].subnet[*].id)[0]]
  nic_name = ["vnet-a-vm1-nic", "vnet-b-vm1-nic"]
  location = [azurerm_virtual_network.az_vnet[1].location, azurerm_virtual_network.az_vnet[2].location]
  rg_name = azurerm_resource_group.azrg_vnet.name
  vm_username = var.vm_username
  vm_password = var.vm_password
  
}