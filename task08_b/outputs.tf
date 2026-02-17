output "redis_fqdn" {
  description = "FQDN of Redis in Azure Container Instance."
  value       = module.aci_redis.redis_fqdn
}

output "aca_fqdn" {
  description = "FQDN of App in Azure Container App."
  value       = module.aca.aca_url
}

output "aks_lb_ip" {
  description = "Load Balancer IP address of App in AKS."
  value       = module.k8s.service_ip
}
