resource "google_container_cluster" "gateway-cluster" {
  name = "gateway-cluster"
  location = "europe-west1"
  network = google_compute_network.descriptor_vpc.id
  subnetwork = google_compute_subnetwork.descriptor_vpc_sub.id
  initial_node_count = 1
  
  deletion_protection = false
  
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  cluster_autoscaling {
    enabled = true
    resource_limits {
      resource_type = "cpu"
      minimum = 1
      maximum = 2
    }
    resource_limits {
      resource_type = "memory"
      minimum = 1
      maximum = 2
    }
  }
}
