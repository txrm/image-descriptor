resource "kubernetes_manifest" "manifest" {
  manifest = yamldecode(file("${path.module}/front.yml"))
}
