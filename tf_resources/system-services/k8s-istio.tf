resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

resource "helm_release" "istio_base" {
  name  = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart = "base"
  version = "1.23.2"

  timeout = 120
  cleanup_on_fail = true
  force_update    = false
  namespace       = kubernetes_namespace.istio_system.metadata.0.name

}

resource "helm_release" "istiod" {
  name  = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart = "istiod"
  version = "1.23.2"

  timeout = 120
  cleanup_on_fail = true
  force_update    = false
  namespace       = kubernetes_namespace.istio_system.metadata.0.name

  set {
    name = "meshConfig.accessLogFile"
    value = "/dev/stdout"
  }

}

resource "helm_release" "istio_ingress" {
  name  = "istio-ingress"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart = "gateway"
  version = "1.23.2"

  timeout = 500
  cleanup_on_fail = true
  force_update    = false
  namespace       = kubernetes_namespace.istio_system.metadata.0.name

}

