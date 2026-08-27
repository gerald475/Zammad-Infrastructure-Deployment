output "minio_service_name" {
  description = "Kubernetes DNS service name for MinIO"
  value       = kubernetes_service.this.metadata[0].name
}

output "minio_s3_endpoint" {
  description = "Internal S3 URL endpoint for Zammad"
  value       = "http://${kubernetes_service.this.metadata[0].name}.${var.namespace}.svc.cluster.local:9000"
}
