variable "aks_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The location of the resource group."
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix"
}

variable "default_node_pool_name" {
  type        = string
  description = "Node Pool Name"
}

variable "default_node_pool_node_count" {
  type        = number
  description = "Node Pool Node Count"
}

variable "default_node_pool_vm_size" {
  type        = string
  description = "Node Pool VM Size"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "key_vault_id" {
  type        = string
  description = "Key Vault ID"
}

variable "acr_id" {
  type        = string
  description = "The ID of the Azure Container Registry."
}
