resource "azurerm_resource_group" "rgAKS" {
  name     = "rg-demo-aks-${random_integer.uniqPart.result}-euw"
  location = "West Europe"
  tags = {
    persistent = "no"
  }
}

resource "random_integer" "uniqPart" {
  min = 1000
  max = 5000
}


resource "azurerm_kubernetes_cluster" "aksfirst" {
  name                = "demo-aks-${random_integer.uniqPart.result}"
  location            = azurerm_resource_group.rgAKS.location
  resource_group_name = azurerm_resource_group.rgAKS.name
  dns_prefix          = "demoaks${random_integer.uniqPart.result}"
  node_resource_group = "rg-demo-aks-${random_integer.uniqPart.result}-pool-euw"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


