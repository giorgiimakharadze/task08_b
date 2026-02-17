output "service_ip" {
  value       = data.kubernetes_service.app_service.status[0].loadBalancer.ingress[0].ip
  description = "Load Balancer IP"
}
