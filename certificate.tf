# resource "kubernetes_manifest" "certificate_testkoinrun" {
#   manifest = {
#     "apiVersion" = "cert-manager.io/v1"
#     "kind"       = "Certificate"
#     "metadata" = {
#       "name"      = "eks-testkoinrun-tls"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "privateKey" = {
#         "algorithm" = "RSA"
#         "encoding"  = "PKCS1"
#         "size"      = 2048
#       }
#       "dnsNames" = [
#         "test.koin.run"
#       ]
#       "issuerRef" = {
#         "kind" = "ClusterIssuer"
#         "name" = "letsencrypt-cluster-issuer"
#       }
#       "secretName" = "eks-testkoinrun-tls"
#     }
#   }
# }
