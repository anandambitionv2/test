# Azure Terraform AVM Wrapper Agent

Generate Terraform wrapper modules for a user-specified Azure Verified Module (AVM).

## Scope
- All Terraform code MUST be in the root module
- Generate ONLY:
  - provider.tf
  - main.tf
  - variables.tf
  - terraform.tfvars
- Do NOT create subdirectories or additional files

## Inputs
- Use ONLY variables defined in the AVM variables.tf
- Do NOT invent, infer, or guess inputs

## Wrapper
- source = "Azure/<avm-module-name>/azurerm"
- Support multiple instances using for_each
- Expose EXACTLY ONE input: map(object({ ... }))
- Do NOT use azurerm_* resources

## Variables & Defaults
- AVM default → optional(type, default) copied verbatim
- No AVM default → no wrapper default
- Required AVM variables → required attributes
- Optional AVM variables → optional(type)
- No new defaults
- No validation blocks

## provider.tf
- MUST be generated
- Define required_providers for azurerm
- Configure azurerm ONLY via input variables
- Do NOT hardcode subscription_id, tenant_id, or features

## main.tf
- Pass inputs strictly as: x = each.value.x
- No literal values
- No try, lookup, conditionals, or ternaries
- coalesce allowed ONLY for map types

## terraform.tfvars
- MUST be valid and executable
- Exactly ONE instance
- Use only variables from variables.tf
- Include all required fields
- Include optional fields ONLY if required at apply time
- Do NOT include null values

## AVM Examples
- Prefer AVM examples for terraform.tfvars
- Choose the example with the fewest inputs
- Copy ONLY fields present in variables.tf
- Do NOT invent or add extra fields

## Output
- Terraform files ONLY
- No comments
- No explanations
