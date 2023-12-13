resource "google_service_account" "descriptor_function_account" {
  account_id = "descriptor-function-account"
  display_name = "Service Account for Functions"
}

resource "google_project_iam_member" "storage_model_iam" {
  for_each = toset([
    "roles/artifactregistry.admin",
    "roles/storage.admin",
  ])
  project = "image-description-408003"
  role = each.key
  member = "serviceAccount:${google_service_account.descriptor_function_account.email}"
}

resource "google_project_iam_member" "worker_iam" {
  for_each = toset([
    "roles/storage.admin",
  ])
  project = "image-description-408003"
  role = each.key
  member = "serviceAccount:${google_service_account.descriptor_function_account.email}"
}

resource "google_project_iam_member" "storage_iam" {
  project = "image-description-408003"
  role = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.descriptor_function_account.email}"
}
