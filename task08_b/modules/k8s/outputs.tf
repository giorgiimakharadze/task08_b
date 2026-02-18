output "service_ip" {
  value       = data.kubernetes_service_v1.app_service.status[0].load_balancer[0].ingress[0].ip
  description = "Load Balancer IP"
}
