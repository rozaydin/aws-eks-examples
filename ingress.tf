resource "kubernetes_ingress_v1" "application" {

  metadata {
    name = "application"
    annotations = {
    #   "nginx.ingress.kubernetes.io/ssl-redirect"       = "true"
    #   "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
    #   "nginx.ingress.kubernetes.io/rewrite-target"     = "/"
    #   "nginx.ingress.kubernetes.io/ssl-passthrough"    = "false"
    #   "kubernetes.io/ingress.class"                    = "nginx"
     "kubernetes.io/ingress.class"            = "alb"
     "alb.ingress.kubernetes.io/scheme"       = "internet-facing"
     "alb.ingress.kubernetes.io/listen-ports" = "[{\"HTTPS\": 443}]"
     # This annotation or set service type to nodeport - https://github.com/kubernetes-sigs/aws-load-balancer-controller/issues/1695
     "alb.ingress.kubernetes.io/target-type"  = "ip"
    }
  }

  spec {

    tls {
      hosts       = ["test.koin.run"]
    }

    rule {
      host = "test.koin.run"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "nginx-service"
              port {
                number = 80
              }
            }

          }
        }
      }
    }

  }

}
