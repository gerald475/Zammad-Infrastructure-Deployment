resource "helm_release" "this" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = var.namespace
  version    = var.chart_version

  set {
    name  = "server.service.type"
    value = var.service_type
  }

  set {
    name  = "global.resources.requests.memory"
    value = var.memory_request
  }
}
