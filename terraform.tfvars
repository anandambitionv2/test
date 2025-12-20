aks_clusters = {
  prod = {
    location            = "eastus"
    name                = "prod-aks-cluster"
    resource_group_name = "prod-aks-rg"
    network = {
      node_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/prod-aks-rg/providers/Microsoft.Network/virtualNetworks/prod-vnet/subnets/aks-subnet"
      pod_cidr       = "10.244.0.0/16"
    }
  }
}
