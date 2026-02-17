variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "aca_env_name" {
  description = "The name of the Azure Container App Environment."
  type        = string
}

variable "aca_name" {
  description = "The name of the Azure Container App."
  type        = string
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry."
  type        = string
}

variable "acr_server" {
  description = "The login server of the Azure Container Registry."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault."
  type        = string
}

variable "container_image_name" {
  description = "The name of the container image to deploy."
  type        = string
}

variable "target_port" {
  description = "The target port for the container."
  type        = number
  default     = 80
}

variable "workload_profile_name" {
  description = "The name of the workload profile to use for the Container App."
  type        = string
  default     = "Consumption"
}

variable "aca_env_workload_profile_type" {
  description = "The workload profile type for the Container App Environment."
  type        = string
  default     = "Consumption"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "container_secrets" {
  description = "List of secrets for the container."
  type = list(object({
    name                = string
    key_vault_secret_id = string
  }))
  default = []
}

variable "container_env" {
  description = "List of environment variables for the container."
  type = list(object({
    name        = string
    value       = optional(string)
    secret_name = optional(string)
  }))
}
