resource "google_cloud_run_v2_service" "model_cloudrun" {
  name = "model-downloader"
  location = "europe-west1"

  template {
    service_account = google_service_account.descriptor_function_account.email
    containers {
      image = var.model_docker
      env {
        name = "BUCKET_NAME"
        value = google_storage_bucket.model_bucket.name
      }
      resources {
        limits = {
          cpu = "2"
          memory = "4Gi"
        }
      }
    } 
  }
}

resource "google_cloud_run_v2_service" "worker_cloudrun" {
  name = "descriptor-worker"
  location = "europe-west1"

  template {
    service_account = google_service_account.descriptor_function_account.email
    containers {
      image = var.worker_docker
      env {
        name = "BUCKET_NAME"
        value = google_storage_bucket.model_bucket.name
      }
      resources {
        limits = {
          cpu = "8"
          memory = "16Gi"
        }
        startup_cpu_boost = true
      }
    }
  }
}
