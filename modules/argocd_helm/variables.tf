variable "namespace" {
  type        = string
  description = "Target Kubernetes namespace for Argo CD deployment"
}

variable "chart_version" {
  type        = string
  default     = "7.4.5"
  description = "Version of the Argo CD Helm chart"
}

variable "service_type" {
  type        = string
  default     = "ClusterIP"
  description = "Kubernetes service type for Argo CD server"
}

variable "memory_request" {
  type        = string
  default     = "128Mi"
  description = "Memory request allocation to fit lean local limits"
}
