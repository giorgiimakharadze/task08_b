output "id" {
  value       = azurerm_key_vault.keyvault.id
  description = "Key Vault ID"
}

output "name" {
  value       = azurerm_key_vault.keyvault.name
  description = "Key Vault name"
}

output "vault_uri" {
  value       = azurerm_key_vault.keyvault.vault_uri
  description = "Key Vault URI"
}

output "tenant_id" {
  value       = azurerm_key_vault.keyvault.tenant_id
  description = "Tenant ID"
}
