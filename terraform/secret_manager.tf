resource "google_secret_manager_secret" "gcp-secret" {
  secret_id = "SSL-secret"

  labels = {
    label = "ssl-certificate"
  }
  replication {
    user_managed {
      replicas {
        location = "europe-southwest1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }

  depends_on = [google_project_service.secret_manager]
}
