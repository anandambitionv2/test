subscription_id                        = "00000000-0000-0000-0000-000000000000"
tenant_id                              = "00000000-0000-0000-0000-000000000000"
prevent_deletion_if_contains_resources = false

cognitive_services_accounts = {
  "openai_instance" = {
    kind      = "OpenAI"
    location  = "eastus"
    name      = "openai-account"
    parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/openai-rg"
    sku_name  = "S0"
    cognitive_deployments = {
      "gpt-4o-mini" = {
        name = "gpt-4o-mini"
        model = {
          format  = "OpenAI"
          name    = "gpt-4o-mini"
          version = "2024-07-18"
        }
        scale = {
          type = "Standard"
        }
      }
    }
    enable_telemetry = false
    network_acls = {
      default_action = "Deny"
      virtual_network_rules = [
        {
          subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/openai-rg/providers/Microsoft.Network/virtualNetworks/vnet/subnets/openai"
        }
      ]
    }
    private_endpoints = {
      pe_endpoint = {
        name                            = "pe_endpoint"
        private_dns_zone_resource_ids   = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/openai-rg/providers/Microsoft.Network/privateDnsZones/privatelink.openai.azure.com"]
        private_service_connection_name = "pe_endpoint_connection"
        subnet_resource_id              = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/openai-rg/providers/Microsoft.Network/virtualNetworks/vnet/subnets/openai"
      }
    }
  }
}
