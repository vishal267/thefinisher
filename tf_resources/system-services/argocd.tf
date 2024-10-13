resource "helm_release" "argo_cd" {
  name  = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "7.6.8"
  namespace = "argo-cd"
  create_namespace = true

  timeout = 120
  cleanup_on_fail = true
  force_update    = false

}
