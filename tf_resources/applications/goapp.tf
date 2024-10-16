resource "kubectl_manifest" "test" {
  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: 'go-app'
  namespace: argo-cd
#  annotations:
#    notifications.argoproj.io/subscribe.on-deployed.slack: k8s-deployment-status
#    notifications.argoproj.io/subscribe.on-sync-failed.slack: k8s-deployment-status
#    notifications.argoproj.io/subscribe.on-sync-succeeded.slack: k8s-deployment-status
spec:
  destination:
    name: 'in-cluster'
    namespace: 'goapp-service'
  source:
    path: 'goapp-service'
    repoURL: 'https://github.com/vishal267/thefinisher-app-manifests/'
    targetRevision: HEAD
    helm:
      valueFiles:
      - values.yaml
  project: 'default'
  syncPolicy:
    automated:
      prune: true  # Optional: Automatically prune resources that are no longer tracked
      selfHeal: true  # Optional: Automatically sync resources
    syncOptions:
      - CreateNamespace=true  # Ensure this is correctly nested
YAML
}