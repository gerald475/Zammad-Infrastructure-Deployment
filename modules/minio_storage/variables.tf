variable "namespace" {
  type        = string
  description = "Namespace where MinIO will be deployed"
}

variable "minio_root_user" {
  type        = string
  default     = "minioadmin"
  description = "MinIO access key"
}

variable "minio_root_password" {
  type        = string
  default     = "minioadminsecure"
  sensitive   = true
  description = "MinIO secret key"
}
