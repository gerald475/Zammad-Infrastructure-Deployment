resource "kubernetes_namespace" "this" {
  for_each = var.namespaces

  metadata {
    name = each.value

    labels = {
      "managed-by"  = "terraform"
      "environment" = var.environment
    }
  }
}
