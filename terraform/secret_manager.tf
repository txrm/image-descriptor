resource "google_secret_manager_secret" "gcp-secret" {
  secret_id = "SSL-secret"

  labels = {
    label = "SSL certificate"
  }
  replication {
    user_managed {
      replicas {
        location = "europe-south1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }
}
