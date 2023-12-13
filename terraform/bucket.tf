resource "google_storage_bucket" "model_bucket" {
  name = "sd2023_descriptor"
  location = "europe-west1-b"
  force_destroy = true
}
