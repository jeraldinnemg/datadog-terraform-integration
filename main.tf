terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    datadog = {
      source = "datadog/datadog"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "datadog" {
  api_key = data.azurerm_key_vault_secret.datadog_api_key.value
  app_key = data.azurerm_key_vault_secret.datadog_app_key.value
  api_url = "https://api.us5.datadoghq.com"
}
