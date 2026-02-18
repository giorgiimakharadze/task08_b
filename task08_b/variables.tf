variable "resources_name_prefix" {
  description = "Prefix for all resource names."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "acr_task_name" {
  description = "Name of the ACR build task."
  type        = string
}

variable "acr_image_names" {
  description = "List of image names to tag the built image."
  type        = list(string)
}

variable "storage_container_name" {
  description = "Name of the storage container."
  type        = string
}

variable "storage_blob_name" {
  description = "Name of the storage blob."
  type        = string
}

variable "app_source_dir" {
  description = "Path to the application source directory to archive."
  type        = string
}

variable "archive_output_path" {
  description = "Output path for the generated archive file."
  type        = string
}

variable "redis_image" {
  description = "Redis Docker image to use."
  type        = string
  default     = "mcr.microsoft.com/cbl-mariner/base/redis:6.2"
}

variable "redis_hostname_secret_name" {
  description = "Key Vault secret name for Redis hostname."
  type        = string
  default     = "redis-hostname"
}

variable "redis_password_secret_name" {
  description = "Key Vault secret name for Redis password."
  type        = string
  default     = "redis-password"
}

variable "aks_default_node_pool_name" {
  description = "Name of the default AKS node pool."
  type        = string
  default     = "default"
}

variable "aks_default_node_pool_node_count" {
  description = "Number of nodes in the default AKS node pool."
  type        = number
  default     = 1
}

variable "aks_default_node_pool_vm_size" {
  description = "VM size for the default AKS node pool."
  type        = string
  default     = "Standard_B2s"
}

variable "aks_default_node_pool_os_disk_type" {
  description = "OS disk type for the default AKS node pool."
  type        = string
  default     = "Managed"
}

variable "container_image_name" {
  description = "Name of the container image to deploy."
  type        = string
}

variable "image_tag" {
  description = "Tag of the container image for K8s deployment."
  type        = string
  default     = "latest"
}

variable "k8s_service_name" {
  description = "Name of the Kubernetes service."
  type        = string
}
