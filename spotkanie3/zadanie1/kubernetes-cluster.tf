resource "azurerm_kubernetes_cluster" "aks-bp-clusterdev01" {
  name                = "aks-bp-clusterdev01"
  location            = azurerm_resource_group.k8s-dev.location
  resource_group_name = azurerm_resource_group.k8s-dev.name
  dns_prefix          = "aks-bp-clusterdev01"

  node_resource_group = format("%s-%s", var.aks-cluster-name, local.studentPrefix)

  default_node_pool {
    name       = "default"
    vnet_subnet_id = azurerm_subnet.vnet-spoke-prd-private-aks-subnet.id
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}