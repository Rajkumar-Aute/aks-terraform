/*
# nodes pool for linux 
resource "azurerm_kubernetes_cluster_node_pool" "aks_linux" {
  name                  = "linuxnodes"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  zones                 = [1, 2, 3]
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 1
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 30
  os_type               = "Linux"
  vm_size               = "Standard_DS2_v2"
  priority              = "Regular" # spot instance can be used
  vnet_subnet_id = azurerm_subnet.aks-subnet.id
  node_labels = {
    "creater"     = var.team_name,
    "environment" = var.environment,
    "mode"        = var.mode,
    "os"          = "Linux"
  }
  tags = {
    "creater"     = var.team_name,
    "environment" = var.environment,
    "mode"        = var.mode,
    "os"          = "Linux"
  }
}

*/