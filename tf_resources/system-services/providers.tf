terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config" # Or specify an environment variable if you don't want to hardcode it.
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Path to your kubeconfig file.
  }
}



