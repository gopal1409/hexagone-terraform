resource "azurerm_linux_virtual_machine" "name" {
  name = "mylinuxvm-1"
  computer_name = "devlinux-vm1"
  resource_group_name = azurerm_resource_group.ag_rg.name
  location = azurerm_resource_group.ag_rg.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.myvnic.id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform.azure.pub")
  }
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Redhat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
}