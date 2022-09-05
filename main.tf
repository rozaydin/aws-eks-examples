terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "rozaydin"
  region  = "eu-central-1"
}

# Credentials
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:eu-central-1:221148627084:cluster/rozaydin-eks"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "arn:aws:eks:eu-central-1:221148627084:cluster/rozaydin-eks"
  }
}

# resource "helm_release" "nginx_ingress" {
#   name       = "nginx-ingress-controller"
#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "nginx-ingress-controller"
#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }
# }


# resource "kubernetes_namespace" "cert_manager" {
#   metadata {
#     labels = {
#       "app" = "cert-manager"
#     }
#     name = "cert-manager"
#   }
# }

# resource "helm_release" "cert_manager" {
#   name      = "cert-manager"
#   namespace = kubernetes_namespace.cert_manager.metadata.0.name

#   repository = "https://charts.jetstack.io"
#   chart      = "cert-manager"

#   set {
#     name  = "installCRDs"
#     value = true
#   }

# }
