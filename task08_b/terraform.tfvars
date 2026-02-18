resources_name_prefix = "cmtr-2lfxdvp4-mod8b"
location              = "eastus"

tags = {
  Creator = "giorgi_makharadze@epam.com"
}

# ACR
acr_task_name = "build-app"
acr_image_names = [
  "cmtr-2lfxdvp4-mod8b-app:latest"
]

# Storage
storage_container_name = "app-content"
storage_blob_name      = "app.zip"
app_source_dir         = "./application"
archive_output_path    = "./application.zip"

# AKS
aks_default_node_pool_name         = "system"
aks_default_node_pool_node_count   = 1
aks_default_node_pool_vm_size      = "Standard_D2ads_v6"
aks_default_node_pool_os_disk_type = "Ephemeral"

# Redis secrets
redis_hostname_secret_name = "redis-hostname"
redis_password_secret_name = "redis-password"

# Container image
container_image_name = "cmtr-2lfxdvp4-mod8b-app"

# K8s
k8s_service_name = "redis-flask-app-service"
image_tag        = "latest"
