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


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "aks-demo-${random_integer.uniqPart.result}"
  location            = azurerm_resource_group.rgAKS.location
  resource_group_name = azurerm_resource_group.rgAKS.name
  dns_prefix          = "aks-demo-${random_integer.uniqPart.result}"
  kubernetes_version  = var.kubernetes_version
  role_based_access_control_enabled = true
  node_resource_group = "rg-demo-aks-${random_integer.uniqPart.result}-euw-pool"
  ingress_application_gateway {
    subnet_id = azurerm_subnet.snet-appGw.id
    gateway_name = "appgw-aks-demo-${random_integer.uniqPart.result}"
    
  }
  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
  }
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name                 = "agentpool"
    node_count           = var.agent_count
    vm_size              = var.vm_size
    vnet_subnet_id       = azurerm_subnet.snet-aks.id
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
  }

  identity {
    type = "SystemAssigned"
  }

}


resource "azurerm_role_assignment" "aksCluster" {
  scope = azurerm_resource_group.rgAKS.id
  principal_id = azurerm_kubernetes_cluster.k8s.identity[0].principal_id
  role_definition_name = "Contributor"
}

# data "azurerm_route_table" "aks" {
#   resource_group_name = azurerm_kubernetes_cluster.k8s.node_resource_group
#   name = azurerm_kubernetes_cluster.k8s.