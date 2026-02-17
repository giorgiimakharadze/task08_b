locals {
  name_prefix    = var.resources_name_prefix
  aca_name       = "${local.name_prefix}-aca"
  aca_env_name   = "${local.name_prefix}-aca-env"
  acr_name       = replace("${local.name_prefix}acr", "-", "")
  aks_name       = "${local.name_prefix}-aks"
  keyvault_name  = "${local.name_prefix}-kv"
  redis_aci_name = "${local.name_prefix}-redis-aci"
  rg_name        = "${local.name_prefix}-rg"
  sa_name        = replace("${local.name_prefix}sa", "-", "")
}
