variable "aks_kv_access_identity_id" {
  type        = string
  description = "The Object ID of the AKS kubelet identity."
}

variable "kv_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "redis_url_secret_name" {
  type        = string
  description = "The name of the Redis URL secret."
}

variable "redis_password_secret_name" {
  type        = string
  description = "The name of the Redis password secret."
}

variable "acr_login_server" {
  type        = string
  description = "The login server of the ACR."
}

variable "app_image_name" {
  type        = string
  description = "The name of the app image."
}

variable "image_tag" {
  type        = string
  description = "The tag of the app image."
}

variable "service_name" {
  type        = string
  description = "The name of the service."
}

variable "templates_path" {
  type        = string
  description = "Path to the directory containing K8s manifest templates."
}
