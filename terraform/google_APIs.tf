resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "kubernetes_engine" {
  service = "container.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "secret_manager" {
  service = "secretmanager.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "compute_engine" {
  service = "compute.googleapis.com"
  disable_on_destroy = true
}
