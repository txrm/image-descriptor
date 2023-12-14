resource "google_secret_manager_secret" "gcp-secret" {
  secret_id = "SSL-secret"

  labels = {
    label = "SSL certificate"
  }
}
