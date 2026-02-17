data "azurerm_client_config" "current" {}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${var.templates_path}/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = var.aks_kv_access_identity_id
    kv_name                    = var.kv_name
    redis_url_secret_name      = var.redis_url_secret_name
    redis_password_secret_name = var.redis_password_secret_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${var.templates_path}/deployment.yaml.tftpl", {
    acr_login_server = var.acr_login_server
    app_image_name   = var.app_image_name
    image_tag        = var.image_tag
  })
  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${var.templates_path}/service.yaml")
  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
  depends_on = [kubectl_manifest.deployment]
}


data "kubernetes_service" "app_service" {
  metadata {
    name = var.service_name
  }

  depends_on = [kubectl_manifest.service]
}

