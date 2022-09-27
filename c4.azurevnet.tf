#create virtual net
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet-1"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.ag_rg.location
  resource_group_name = azurerm_resource_group.ag_rg.name
}

#create subnet
resource "azurerm_subnet" "mysubnet" {
  name = "mysubnet-1"
  resource_group_name = azurerm_resource_group.ag_rg.name 
  virtual_network_name = azurerm_virtual_network.myvnet.name 
  address_prefixes = ["10.0.2.0/24"]
}
#create public ip
resource "azurerm_public_ip" "mypublicip" {
name="mypublicip-1"
  depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
  ]
  resource_group_name = azurerm_resource_group.ag_rg.name 
  location = azurerm_resource_group.ag_rg.location
  allocation_method = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"

  tags = {
    "environment" = "Dev"
  }
}
#create network interface
resource "azurerm_network_interface" "myvnic" {
  name = "myvnic"
   resource_group_name = azurerm_resource_group.ag_rg.name 
  location = azurerm_resource_group.ag_rg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
  
}