data "archive_file" "app" {
  type        = "tar.gz"
  source_dir  = var.source_dir
  output_path = var.archive_output_path
}

resource "time_static" "sas_start" {}

resource "time_offset" "sas_expiry" {
  offset_days = var.sas_expiry_days
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  container_access_type = var.container_access_type
  storage_account_name  = azurerm_storage_account.storage.name
}

resource "azurerm_storage_blob" "app_blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = data.archive_file.app.output_path
  content_md5            = data.archive_file.app.output_md5
}

data "azurerm_storage_account_blob_container_sas" "container_sas" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.container.name
  https_only        = true

  start  = time_static.sas_start.rfc3339
  expiry = time_offset.sas_expiry.rfc3339

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}
