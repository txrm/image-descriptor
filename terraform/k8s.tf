resource "google_container_cluster" "gateway-cluster" {
  name = "gateway-cluster"
  location = "europe-west1-b"
  initial_node_count = 1
}

resource "google_container_node_pool" "pool" {
  name = "pool"
  cluster = "${google_container_cluster.gateway-cluster.name}"
  location = "europe-west1"
  node_count = "1"
  node_config {
    machine_type = "g1-small"
  }
}
