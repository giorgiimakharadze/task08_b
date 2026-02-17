terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "kubectl" {
  host                   = module.aks.kube_config_structured[0].host
  cluster_ca_certificate = base64decode(module.aks.kube_config_structured[0].cluster_ca_certificate)
  token                  = module.aks.kube_config_structured[0].token
  load_config_file       = false
}

provider "kubernetes" {
  host                   = module.aks.kube_config_structured[0].host
  cluster_ca_certificate = base64decode(module.aks.kube_config_structured[0].cluster_ca_certificate)
  token                  = module.aks.kube_config_structured[0].token
}
