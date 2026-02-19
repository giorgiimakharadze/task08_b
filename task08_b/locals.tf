locals {
  name_prefix    = var.resources_name_prefix
  aca_name       = "${local.name_prefix}-ca"
  aca_env_name   = "${local.name_prefix}-cae"
  acr_name       = replace("${local.name_prefix}cr", "-", "")
  aks_name       = "${local.name_prefix}-aks"
  keyvault_name  = "${local.name_prefix}-kv"
  redis_aci_name = "${local.name_prefix}-redis-ci"
  rg_name        = "${local.name_prefix}-rg"
  sa_name        = replace("${local.name_prefix}sa", "-", "")
}
