resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build_task" {
  name                  = var.task_name
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = var.dockerfile_path
    context_path         = var.context_path
    context_access_token = var.context_access_token
    image_names          = var.image_names
  }

  agent_pool_name = var.agent_pool_name
  tags            = var.tags
}

resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  count                      = var.trigger_task_on_creation ? 1 : 0
  container_registry_task_id = azurerm_container_registry_task.build_task.id
}
