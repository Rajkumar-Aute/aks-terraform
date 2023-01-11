# create AZ AD Group for AKS Admin
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group

resource "azuread_group" "aks_administrators" {
  display_name     = "${azurerm_resource_group.aks_cluster_rg.name}-cluster-administrators"
  description      = "Azure AKS administrator group for the ${azurerm_resource_group.aks_cluster_rg.name}"
  mail_enabled     = true
  types            = ["Unified"]
  mail_nickname    = "${azurerm_resource_group.aks_cluster_rg.name}-cluster-administrators"
  security_enabled = true
}