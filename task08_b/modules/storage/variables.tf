variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "account_tier" {
  description = "The tier of the Storage Account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the Storage Account."
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "The name of the Storage Container."
  type        = string
}

variable "container_access_type" {
  description = "The access level for the Storage Container."
  type        = string
  default     = "private"
}

variable "blob_name" {
  description = "The name of the Storage Blob."
  type        = string
}

variable "source_dir" {
  description = "Path to the application directory to archive."
  type        = string
}

variable "archive_output_path" {
  description = "Output path for the generated archive file."
  type        = string
}

variable "sas_expiry_days" {
  description = "Number of days until the SAS token expires."
  type        = number
  default     = 365
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
