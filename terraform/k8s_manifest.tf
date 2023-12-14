resource "kubernetes_manifest" "deployment_manifest" {
  manifest = yamldecode(file("${path.module}/manifest/deployment.yml"))
}

resource "kubernetes_manifest" "service_manifest" {
  manifest = yamldecode(file("${path.module}/manifest/service.yml"))
}

resource "kubernetes_manifest" "ingress_manifest" {
  manifest = yamldecode(file("${path.module}/manifest/ingress.yml"))
}
