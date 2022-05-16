output "bucket-spinnaker" {
  description = "Bucket created by the module."
  value       = google_storage_bucket.bucket-spinnaker
}

output "bucket-kubernetes-manifests" {
  description = "Bucket created by the module."
  value       = google_storage_bucket.bucket-manifests
}