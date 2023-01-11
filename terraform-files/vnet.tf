/*
# creating custom vnet 
resource "azurerm_virtual_network" "aks-vnet" {
    name =    "${var.aks_cluster_name}-${var.environment}-vent"
    location = azurerm_resource_group.aks_cluster_rg.location
    resource_group_name = azurerm_resource_group.aks_cluster_rg.name
    address_space = var.cidrrange
}

# creating custom subnet
resource "azurerm_subnet" "aks-subnet" {
    name = "${var.aks_cluster_name}-${var.environment}-vent-subnet"
    virtual_network_name = azurerm_virtual_network.aks-vnet.name
    resource_group_name = azurerm_resource_group.aks_cluster_rg.name
    address_prefixes = var.subnet 
}
*/