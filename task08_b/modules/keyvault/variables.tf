variable "name" {
  type        = string
  description = "Key Vault name"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "sku_name" {
  type        = string
  description = "SKU name for Key Vault (standard or premium)"
  default     = "standard"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Number of days to retain deleted Key Vault"
  default     = 7
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Enable purge protection"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
