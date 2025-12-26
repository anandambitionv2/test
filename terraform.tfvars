subscription_id = "00000000-0000-0000-0000-000000000000"
tenant_id       = "00000000-0000-0000-0000-000000000000"

cognitive_accounts = {
  "openai-account" = {
    kind      = "OpenAI"
    location  = "eastus"
    name      = "openai-account-example"
    parent_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg"
    sku_name  = "S0"
  }
}
