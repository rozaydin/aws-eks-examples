resource "kubernetes_service" "nginx_nlb_service" {

  metadata {
    name = "nginx-nlb-service"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" : "external"
      "service.beta.kubernetes.io/aws-load-balancer-backend-protocol" : "tcp"
      "service.beta.kubernetes.io/aws-load-balancer-type" : "nlb"
    }
  }

  spec {

    selector = {
      "app" = "nginx-app"
    }

    port {
      port        = 80
      target_port = 80
      name        = "http"
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "nginx_service" {

  metadata {
    name = "nginx-service"
  }

  spec {

    selector = {
      "app" = "nginx-app"
    }

    port {
      port        = 80
      target_port = 80
      name        = "http"
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }

}

resource "kubernetes_deployment" "nginx" {

  metadata {
    name = "nginx-deployment"
  }

  spec {

    replicas = 3

    selector {
      match_labels = {
        app = "nginx-app"
      }
    }

    template {

      metadata {
        labels = {
          "app" = "nginx-app"
        }
      }

      spec {

        container {

          image = "nginx"
          name  = "app"
          # Always
          # IfNotPresent
          image_pull_policy = "Always"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
