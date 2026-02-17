data "azurerm_client_config" "current" {}

resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = "${var.aca_name}-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.aca_identity.principal_id
}

resource "azurerm_key_vault_access_policy" "aca_kv_access" {
  key_vault_id = var.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.aca_identity.principal_id

  secret_permissions = [
    "Get",
  ]
}

resource "azurerm_container_app_environment" "aca_env" {
  name                = var.aca_env_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  workload_profile {
    name                  = var.workload_profile_name
    workload_profile_type = var.aca_env_workload_profile_type
  }
}

resource "azurerm_container_app" "aca_app" {
  name                         = var.aca_name
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"
  workload_profile_name        = var.workload_profile_name
  tags                         = var.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aca_identity.id]
  }

  registry {
    server   = var.acr_server
    identity = azurerm_user_assigned_identity.aca_identity.id
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = var.target_port
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "examplecontainerapp"
      image  = "${var.acr_server}/${var.container_image_name}"
      cpu    = 0.25
      memory = "0.5Gi"

      dynamic "env" {
        for_each = var.container_env
        content {
          name        = env.value.name
          value       = env.value.value
          secret_name = env.value.secret_name
        }
      }
    }
  }

  dynamic "secret" {
    for_each = var.container_secrets
    content {
      name                = secret.value.name
      key_vault_secret_id = secret.value.key_vault_secret_id
      identity            = azurerm_user_assigned_identity.aca_identity.id
    }
  }
}
