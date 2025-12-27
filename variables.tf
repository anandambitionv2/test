ttvariable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

variable "cognitive_accounts" {
  type = map(object({
    kind                                          = string
    location                                      = string
    name                                          = string
    parent_id                                     = string
    sku_name                                      = string
    allow_project_management                      = optional(bool, false)
    aml_workspace                                 = optional(object({
      resource_id        = string
      identity_client_id = optional(string, null)
    }), null)
    associated_projects                           = optional(list(string), [])
    cognitive_deployments                         = optional(map(object({
      name                       = string
      rai_policy_name            = optional(string)
      version_upgrade_option     = optional(string, "OnceNewDefaultVersionAvailable")
      dynamic_throttling_enabled = optional(bool, false)
      model                      = object({
        format  = string
        name    = string
        version = optional(string)
      })
      scale                      = object({
        capacity = optional(number, 1)
        family   = optional(string)
        size     = optional(string)
        tier     = optional(string)
        type     = string
      })
      retry                      = optional(object({
        error_message_regex  = list(string)
        interval_seconds     = optional(number, 30)
        max_interval_seconds = optional(number, 300)
        multiplier           = optional(number, 1.5)
        randomization_factor = optional(number, 0.3)
      }))
      timeouts                   = optional(object({
        create = optional(string)
        delete = optional(string)
        read   = optional(string)
        update = optional(string)
      }))
    })), {})
    custom_question_answering_search_service_id   = optional(string)
    custom_question_answering_search_service_key  = optional(string)
    custom_subdomain_name                         = optional(string)
    customer_managed_key                          = optional(object({
      key_vault_resource_id  = string
      key_name               = string
      key_version            = optional(string, null)
      user_assigned_identity = optional(object({
        resource_id = string
      }), null)
    }))
    default_project                               = optional(string)
    deployment_serialization_enabled              = optional(bool, true)
    diagnostic_settings                           = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    dynamic_throttling_enabled                    = optional(bool, false)
    enable_telemetry                              = optional(bool, true)
    fqdns                                         = optional(list(string), [])
    is_hsm_key                                    = optional(bool, false)
    local_auth_enabled                            = optional(bool)
    lock                                          = optional(object({
      kind = string
      name = optional(string, null)
    }))
    managed_identities                            = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }), {})
    network_acls                                  = optional(object({
      default_action = string
      ip_rules       = optional(set(string), [])
      virtual_network_rules = optional(set(object({
        subnet_id                            = string
        ignore_missing_vnet_service_endpoint = optional(bool, false)
      })), [])
    }))
    outbound_network_access_restricted            = optional(bool, false)
    private_endpoints                             = optional(map(object({
      name                                = optional(string, null)
      role_assignments                    = optional(map(object({
        role_definition_id_or_name             = string
        principal_id                           = string
        description                            = optional(string, null)
        skip_service_principal_aad_check       = optional(bool, false)
        condition                              = optional(string, null)
        condition_version                      = optional(string, null)
        delegated_managed_identity_resource_id = optional(string, null)
        principal_type                         = optional(string, null)
      })), {})
      lock                                = optional(object({
        kind = string
        name = optional(string, null)
      }), null)
      tags                                = optional(map(string), null)
      subnet_resource_id                  = string
      private_dns_zone_group_name         = optional(string, "default")
      private_dns_zone_resource_ids       = optional(set(string), [])
      application_security_group_associations = optional(map(string), {})
      private_service_connection_name     = optional(string, null)
      network_interface_name              = optional(string, null)
      location                            = optional(string, null)
      resource_group_name                 = optional(string, null)
      ip_configurations                   = optional(map(object({
        name               = string
        private_ip_address = string
      })), {})
    })), {})
    private_endpoints_manage_dns_zone_group       = optional(bool, true)
    public_network_access_enabled                 = optional(bool, true)
    qna_runtime_endpoint                          = optional(string)
    rai_monitor_config                            = optional(object({
      adx_storage_resource_id = string
      identity_client_id      = optional(string, null)
    }))
    rai_policies                                  = optional(map(object({
      name             = string
      base_policy_name = string
      mode             = string
      content_filters  = optional(list(object({
        blocking           = bool
        enabled            = bool
        name               = string
        severity_threshold = string
        source             = string
      })))
      custom_block_lists = optional(list(object({
        source          = string
        block_list_name = string
        blocking        = bool
      })))
    })), {})
    role_assignments                              = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    storage                                       = optional(list(object({
      identity_client_id = optional(string)
      storage_account_id = string
    })))
    tags                                          = optional(map(string))
    timeouts                                      = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  description = "Map of Azure OpenAI cognitive accounts to create"
}
