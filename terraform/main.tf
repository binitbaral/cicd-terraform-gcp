resource "google_cloud_run_v2_service" "app" {
  name     = var.service_name
  location = var.region
  project  = var.project_id

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }

  ingress = "INGRESS_TRAFFIC_ALL"
}

resource "google_cloud_run_v2_service_iam_member" "public_access" {
  project  = var.project_id
  location = var.region
  service  = google_cloud_run_v2_service.app.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
