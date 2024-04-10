provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "myAksResourceGroup"
  location = "eastus2"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "myAksCluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myaksdns"

  default_node_pool {
    name       = "system"
    node_count = 1
    vm_size    = "Standard_D2_v2"  # This VM size offers 2 vCPUs.
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = "Standard_D2_v2"  # This VM size offers 2 vCPUs.
  node_count            = 1
  mode                  = "User"

  node_labels = {
    "nodepool-type" = "user-nodes"
  }
}
