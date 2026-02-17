resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "keyvault" {
  source              = "./modules/keyvault"
  name                = local.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

module "acr" {
  source               = "./modules/acr"
  acr_name             = local.acr_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  task_name            = var.acr_task_name
  context_path         = module.storage.blob_url
  context_access_token = module.storage.sas_token
  image_names          = var.acr_image_names
  tags                 = var.tags

  depends_on = [module.storage]
}

module "storage" {
  source               = "./modules/storage"
  storage_account_name = local.sa_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  container_name       = var.storage_container_name
  blob_name            = var.storage_blob_name
  source_dir           = var.app_source_dir
  archive_output_path  = var.archive_output_path
  tags                 = var.tags
}

module "aci_redis" {
  source              = "./modules/aci_redis"
  aci_name            = local.redis_aci_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_name_label      = local.redis_aci_name
  redis_image         = var.redis_image
  key_vault_id        = module.keyvault.id
  tags                = var.tags

  depends_on = [module.keyvault]
}

module "aks" {
  source                       = "./modules/aks"
  aks_name                     = local.aks_name
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  dns_prefix                   = local.aks_name
  default_node_pool_name       = var.aks_default_node_pool_name
  default_node_pool_node_count = var.aks_default_node_pool_node_count
  default_node_pool_vm_size    = var.aks_default_node_pool_vm_size
  key_vault_id                 = module.keyvault.id
  acr_id                       = module.acr.acr_id
  tags                         = var.tags

  depends_on = [module.keyvault, module.acr]
}

module "aca" {
  source               = "./modules/aca"
  aca_name             = local.aca_name
  aca_env_name         = local.aca_env_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  acr_id               = module.acr.acr_id
  acr_server           = module.acr.acr_login_server
  key_vault_id         = module.keyvault.id
  container_image_name = var.container_image_name
  tags                 = var.tags

  container_secrets = [
    {
      name                = "redis-url"
      key_vault_secret_id = module.aci_redis.redis_hostname_secret_id
    },
    {
      name                = "redis-key"
      key_vault_secret_id = module.aci_redis.redis_password_secret_id
    }
  ]

  container_env = [
    { name = "CREATOR", value = "ACA", secret_name = null },
    { name = "REDIS_PORT", value = "6379", secret_name = null },
    { name = "REDIS_URL", value = null, secret_name = "redis-url" },
    { name = "REDIS_PWD", value = null, secret_name = "redis-key" },
  ]

  depends_on = [module.keyvault, module.acr, module.aci_redis]
}

module "k8s" {
  source                     = "./modules/k8s"
  templates_path             = "${path.root}/k8s-manifests"
  aks_kv_access_identity_id  = module.aks.kubelet_identity_client_id
  kv_name                    = module.keyvault.name
  redis_url_secret_name      = var.redis_hostname_secret_name
  redis_password_secret_name = var.redis_password_secret_name
  acr_login_server           = module.acr.acr_login_server
  app_image_name             = var.container_image_name
  image_tag                  = var.image_tag
  service_name               = var.k8s_service_name

  depends_on = [module.aks, module.keyvault, module.aci_redis, module.acr]
}
