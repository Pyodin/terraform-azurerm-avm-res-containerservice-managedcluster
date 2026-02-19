output "name" {
  description = "The name of the created cluster extension."
  value       = azurerm_kubernetes_cluster_extension.this.name
}

output "resource_id" {
  description = "The ID of the created cluster extension."
  value       = azurerm_kubernetes_cluster_extension.this.id
}
