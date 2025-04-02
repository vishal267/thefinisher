resource "helm_release" "postgresql" {
  name       = "postgres-cluster"
  namespace  = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "16.6.0"
  create_namespace = true

  values = [
    file("./configs/values.yaml")
  ]
}
