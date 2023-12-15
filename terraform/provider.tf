provider "google" {
  project     = "image-description-408003"
  region      = "europe-west1"
  zone        = "europe-west1-b"
}

provider "kubernetes" {
  host = "${google_container_cluster.gateway-cluster.endpoint}"
  
  load_config_file = true
  config_paths = [
    "manifest/deployment.yml",
    "manifest/service.yml",
    "manifest/ingress.yml"
  ]
  client_certificate = "${base64decode(google_container_cluster.gateway-cluster.master_auth.0.client_certificate)}"
  client_key = "${base64decode(google_container_cluster.gateway-cluster.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.gateway-cluster.master_auth.0.cluster_ca_certificate)}"
}

