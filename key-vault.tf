data "azurerm_key_vault" "datadogkv" {
  name                = "datadog-keys"
  resource_group_name = "demo-rg"
}

data "azurerm_key_vault_secret" "datadog_api_key" {
  name         = "datadog-api-key"
  key_vault_id = data.azurerm_key_vault.datadogkv.id
}

data "azurerm_key_vault_secret" "datadog_app_key" {
  name         = "datadog-app-key"
  key_vault_id = data.azurerm_key_vault.datadogkv.id
}
