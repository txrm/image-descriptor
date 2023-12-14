resource "google_storage_bucket" "model_bucket" {
  name = "sd2023_descriptor"
  location = "EU"
  force_destroy = true
}
