resource "google_compute_network" "descriptor_vpc" {
  project = "image-description-408003"
  name = "descriptor-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "descriptor_vpc_sub" {
  project = "image-description-408003"
  name = "descriptor-subnetwork"
  ip_cidr_range = "10.2.0.0/28"
  region = "europe-west1"
  network = google_compute_network.descriptor_vpc.id
}
