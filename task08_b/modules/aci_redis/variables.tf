variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "aci_name" {
  description = "The name of the Azure Container Instance."
  type        = string
}

variable "dns_name_label" {
  description = "DNS name label for the container group."
  type        = string
}

variable "redis_image" {
  description = "The Redis Docker image to use."
  type        = string
  default     = "mcr.microsoft.com/oss/bitnami/redis:latest"
}

variable "cpu" {
  description = "The number of CPU cores to allocate to the container."
  type        = number
  default     = 1
}

variable "memory" {
  description = "The amount of memory to allocate to the container in GB."
  type        = number
  default     = 1.5
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault to store secrets."
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "The name of the Key Vault secret to store Redis hostname."
  type        = string
  default     = "redis-hostname"
}

variable "redis_password_secret_name" {
  description = "The name of the Key Vault secret to store Redis password."
  type        = string
  default     = "redis-password"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
