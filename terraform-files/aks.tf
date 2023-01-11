# Resource group details
resource "azurerm_resource_group" "aks_cluster_rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location

  tags = {
    "creater"     = var.team_name,
    "environment" = var.environment,
    "mode"        = var.mode
  }
}
# resource group link
# https://portal.azure.com/#blade/HubsExtension/ResourceMenuBlade/id/%2Fsubscriptions%2Fa2bd2bf9-3b7e-457b-9828-0a81f1ffb88e%2FresourceGroups%2FGeneva-Osprey-team-tfstate

/*
# Random resource for feature use
resource "random_pet" "random-name" {
}
*/


resource "azurerm_container_registry" "acr" {
  name                = "${var.aks_cluster_name}${var.environment}acr"
  resource_group_name = azurerm_resource_group.aks_cluster_rg.name
  location            = azurerm_resource_group.aks_cluster_rg.location
  sku                 = "Basic"
}


resource "azurerm_role_assignment" "acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

# Azure Kubernetes Cluster details.
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${var.aks_cluster_name}-${var.environment}"
  location            = azurerm_resource_group.aks_cluster_rg.location
  resource_group_name = azurerm_resource_group.aks_cluster_rg.name
  dns_prefix          = "${var.aks_cluster_name}-${var.environment}"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_cluster_rg.name}-node_resource_group"

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_B2s" #"Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones                = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 1
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    # vnet_subnet_id = azurerm_subnet.aks-subnet.id
    node_labels = {
      "creater"     = var.team_name,
      "environment" = var.environment,
      "mode"        = var.mode
    }
    tags = {
      "creater"     = var.team_name,
      "environment" = var.environment,
      "mode"        = var.mode
    }
  }
  # identity will be SystemAssigned or ServicePrinciple
  identity {
    type = "SystemAssigned"
  }

/*
  # add on profiles
  role_based_access_control_enabled = true

  azure_active_directory_role_based_access_control {
    managed = true
    #    admin_group_object_ids = ["azuread_group.aks_administrators.id"]
    azure_rbac_enabled = true
  }

  azure_policy_enabled = true
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id
  }

*/

  # windows profile
  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "adminuser"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }


  tags = {
    "creater"     = var.team_name,
    "environment" = var.environment,
    "mode"        = var.mode
  }
}