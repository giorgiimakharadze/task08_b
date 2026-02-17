variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the ACR will be created."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled for the ACR."
  type        = bool
  default     = false
}

variable "task_name" {
  description = "The name of the Container Registry Task."
  type        = string
}

variable "dockerfile_path" {
  description = "The path to the Dockerfile relative to the source context."
  type        = string
  default     = "Dockerfile"
}

variable "context_path" {
  description = "The URL or path to the source code context."
  type        = string
}

variable "context_access_token" {
  description = "The access token for the source code context (e.g., GitHub PAT)."
  type        = string
  sensitive   = true
}

variable "image_names" {
  description = "List of image names to tag the built image."
  type        = list(string)
}

variable "agent_pool_name" {
  description = "The name of the agent pool to use for the task."
  type        = string
  default     = null
}

variable "trigger_task_on_creation" {
  description = "Whether to trigger the task immediately after creation."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
