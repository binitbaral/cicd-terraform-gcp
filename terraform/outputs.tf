output "cloud_run_url" {
  description = "Public URL of the Cloud Run service"
  value       = google_cloud_run_v2_service.app.uri
}
