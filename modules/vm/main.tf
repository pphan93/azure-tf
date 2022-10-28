resource "azurerm_network_interface" "vnet_vm_nic" {
  count = var.item_count
  name = var.nic_name[count.index]
  location = var.location[count.index]
  resource_group_name = var.rg_name

  ip_configuration {
    name = "internal"
    subnet_id = var.subnet_id[count.index]
    private_ip_address_allocation = "Dynamic"
  }
}

locals {
  #convert object to list to be use later on
  nic_id = tolist([azurerm_network_interface.vnet_vm_nic[*].id])
}

output "nic" {
  value = local.nic_id
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  count = var.item_count
  name = "vm-${count.index}"
  resource_group_name = var.rg_name
  location = var.location[count.index]
  size = "Standard_F2"
  custom_data = base64encode(file("${path.module}/scripts/ngix_vm_init.sh"))

  network_interface_ids = [azurerm_network_interface.vnet_vm_nic[count.index].id]

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