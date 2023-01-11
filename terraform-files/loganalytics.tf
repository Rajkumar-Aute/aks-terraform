/*
# Log analytics workspace creation details.
resource "azurerm_log_analytics_workspace" "aks_logs" {
  name                = "logs-${var.aks_name}-${var.environment}"
  location            = azurerm_resource_group.aks_cluster_rg.location
  resource_group_name = azurerm_resource_group.aks_cluster_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
*/