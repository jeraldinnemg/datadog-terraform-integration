variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
  default     = "demo-rg"
}

variable "key_vault_id" {
  type        = string
  description = "Azure Key Vault Resource ID"
  default     = "/subscriptions/cb8a6d9a-7932-4ef5-91b1-611f3eaedca0/resourceGroups/demo-rg/providers/Microsoft.KeyVault/vaults/datadog-keys"
}