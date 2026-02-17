output "acr_id" {
  description = "The ID of the Azure Container Registry."
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "The login server of the Azure Container Registry."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "The admin username of the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "The admin password of the Azure Container Registry."
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}

output "task_id" {
  description = "The ID of the Container Registry Task."
  value       = azurerm_container_registry_task.build_task.id
}
