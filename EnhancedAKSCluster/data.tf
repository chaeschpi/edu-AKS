data "azurerm_container_registry" "acr" {
    name = var.acrName
    resource_group_name = var.acrRgName
  
}