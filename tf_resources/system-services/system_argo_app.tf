resource "kubernetes_manifest" "system_services" {
  for_each = toset(fileset("argoapp-files/", "*.yml"))

  manifest = yamldecode(file("argoapp-files/${each.value}"))
}

