output "location" {
  value = azurerm_resource_group.aks_cluster_rg.location
}

output "resource_group_id" {
  value = azurerm_resource_group.aks_cluster_rg.id
}
output "resource_group_name" {
  value = azurerm_resource_group.aks_cluster_rg.name
}



output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id

}
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name

}

output "aks_cluster_version" {
  value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version

}

# AKS version data source details
output "aks_version" {
  value = data.azurerm_kubernetes_service_versions.current.versions
}

output "aks_latest_version" {
  value = data.azurerm_kubernetes_service_versions.current.latest_version
}

/*
output "aks_admin_group_id" {
  value = azuread_group.aks_administrators.id

}
*/