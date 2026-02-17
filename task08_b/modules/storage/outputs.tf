output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.storage.id
}

output "primary_connection_string" {
  description = "The primary connection string for the Storage Account."
  value       = azurerm_storage_account.storage.primary_connection_string
  sensitive   = true
}

output "container_name" {
  description = "The name of the Storage Container."
  value       = azurerm_storage_container.container.name
}

output "blob_url" {
  description = "The URL of the Storage Blob."
  value       = azurerm_storage_blob.app_blob.url
}

output "sas_token" {
  description = "The SAS token for the Blob Container."
  value       = data.azurerm_storage_account_blob_container_sas.container_sas.sas
  sensitive   = true
}

output "blob_url_with_sas" {
  description = "The Blob URL with SAS token appended."
  value       = "${azurerm_storage_blob.app_blob.url}${data.azurerm_storage_account_blob_container_sas.container_sas.sas}"
  sensitive   = true
}
