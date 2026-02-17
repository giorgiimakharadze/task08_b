output "redis_fqdn" {
  description = "The FQDN of the Redis container instance."
  value       = azurerm_container_group.redis.fqdn
}

output "redis_ip_address" {
  description = "The IP address of the Redis container instance."
  value       = azurerm_container_group.redis.ip_address
}

output "redis_password" {
  description = "The Redis password (sensitive)."
  value       = random_password.redis_password.result
  sensitive   = true
}

output "redis_hostname_secret_id" {
  description = "The versionless ID of the Key Vault secret storing Redis hostname."
  value       = azurerm_key_vault_secret.redis_hostname.versionless_id
}

output "redis_password_secret_id" {
  description = "The versionless ID of the Key Vault secret storing Redis password."
  value       = azurerm_key_vault_secret.redis_password.versionless_id
}
