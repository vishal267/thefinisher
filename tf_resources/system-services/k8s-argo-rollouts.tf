resource "kubernetes_namespace" "argo_rollouts" {
  metadata {
    name = "argo-rollouts"
  }
}

resource "helm_release" "argo_rollouts" {
  name  = "argo-rollouts"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-rollouts"
  version = "2.37.5"

  timeout = 120
  cleanup_on_fail = true
  force_update    = false
  namespace       = kubernetes_namespace.argo_rollouts.metadata.0.name

}
