output "aks_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  description = "The FQDN of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_kube_config" {
  description = "The kubeconfig for the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "kubelet_identity_object_id" {
  description = "The Object ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "kubelet_identity_client_id" {
  description = "The Client ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
}

output "kube_config_structured" {
  value       = azurerm_kubernetes_cluster.aks.kube_config
  description = "Structured Kubernetes configuration for provider setup"
  sensitive   = true
}
