resource "azurerm_network_interface" "VNETA_vm1_nic" {
  name = "vnet-a-vm1-nic"
  location = azurerm_virtual_network.az_vnet[1].location
  resource_group_name = azurerm_resource_group.azrg_vnet.name

  ip_configuration {
    name = "internal"
    subnet_id = tolist(azurerm_virtual_network.az_vnet[1].subnet[*].id)[0]
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "VNETB_vm1_nic" {
  name = "vnet-b-vm1-nic"
  location = azurerm_virtual_network.az_vnet[2].location
  resource_group_name = azurerm_resource_group.azrg_vnet.name

  ip_configuration {
    name = "internal"
    subnet_id = tolist(azurerm_virtual_network.az_vnet[2].subnet[*].id)[0]
    private_ip_address_allocation = "Dynamic"
  }
}

locals {
  nic_id = tolist([azurerm_network_interface.VNETA_vm1_nic.id, azurerm_network_interface.VNETB_vm1_nic.id])
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count = 2
  name = "vm-${count.index}"
  resource_group_name = azurerm_resource_group.azrg_vnet.name
  location = azurerm_virtual_network.az_vnet[1 + count.index].location
  size = "Standard_F2"

   network_interface_ids = [local.nic_id[count.index]]

  admin_username = var.vm_username
  admin_password = var.vm_password
  disable_password_authentication = false

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}