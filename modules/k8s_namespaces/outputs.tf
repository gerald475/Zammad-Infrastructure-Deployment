output "namespace_names" {
  description = "Map of created namespace names keyed by their input key"
  value       = { for k, v in kubernetes_namespace.this : k => v.metadata[0].name }
}

output "zammad_namespace" {
  description = "Name of the Zammad namespace"
  value       = kubernetes_namespace.this["zammad"].metadata[0].name
}

output "argocd_namespace" {
  description = "Name of the Argo CD namespace"
  value       = kubernetes_namespace.this["argocd"].metadata[0].name
}
