resource "kubernetes_deployment" "this" {
  metadata {
    name      = "minio"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "minio"
      }
    }

    template {
      metadata {
        labels = {
          app = "minio"
        }
      }

      spec {
        container {
          name  = "minio"
          image = "minio/minio:RELEASE.2024-01-18T22-51-28Z"
          args  = ["server", "/data", "--console-address", ":9001"]

          env {
            name  = "MINIO_ROOT_USER"
            value = var.minio_root_user
          }
          env {
            name  = "MINIO_ROOT_PASSWORD"
            value = var.minio_root_password
          }

          port {
            container_port = 9000
            name           = "s3-api"
          }
          port {
            container_port = 9001
            name           = "console"
          }

          resources {
            limits = {
              memory = "256Mi"
            }
            requests = {
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "this" {
  metadata {
    name      = "minio"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "minio"
    }

    port {
      name        = "s3-api"
      port        = 9000
      target_port = 9000
    }
    port {
      name        = "console"
      port        = 9001
      target_port = 9001
    }
  }
}
