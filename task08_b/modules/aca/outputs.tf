output "aca_url" {
  description = "The URL of the Azure Container App."
  value       = azurerm_container_app.aca_app.latest_revision_fqdn
}

output "aca_identity_principal_id" {
  description = "The Principal ID of the User Assigned Identity for the ACA."
  value       = azurerm_user_assigned_identity.aca_identity.principal_id
}
