resource "random_password" "redis_password" {
  length  = 16
  special = true
}

resource "azurerm_container_group" "redis" {
  name                = var.aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  restart_policy      = "Always"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  tags                = var.tags

  container {
    name   = "redis"
    image  = var.redis_image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 6379
      protocol = "TCP"
    }

    environment_variables = {
      REDIS_PASSWORD = random_password.redis_password.result
    }

    commands = [
      "redis-server",
      "--protected-mode",
      "no",
      "--requirepass",
      random_password.redis_password.result,
    ]
  }
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_hostname_secret_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "redis_password" {
  name         = var.redis_password_secret_name
  value        = random_password.redis_password.result
  key_vault_id = var.key_vault_id
}
