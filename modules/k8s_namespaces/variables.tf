variable "namespaces" {
  description = "Set of Kubernetes namespace names to create"
  type        = set(string)
  default     = ["zammad", "argocd", "monitoring"]
}

variable "environment" {
  description = "Environment tag (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}
