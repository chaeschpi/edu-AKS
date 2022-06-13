resource "azurerm_virtual_network" "vnet" {
    name = "demo-aks-${random_integer.uniqPart.result}"
  address_space = [var.vnetIpRange] 
  resource_group_name = azurerm_resource_group.rgAKS.name
  location = azurerm_resource_group.rgAKS.location
}

resource "azurerm_subnet" "snet-aks" {
  name = "snet-aks"
  address_prefixes = [var.snetIpRangeAks]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rgAKS.name

}

resource "azurerm_subnet" "snet-appGw" {
  name = "snet-appgw"
  address_prefixes = [var.snetIpRangeAppGw]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rgAKS.name
  
}

