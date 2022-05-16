output "sa" {
  description = "Service Account created."
  value       = google_service_account.spinnaker-account
}

/*
output "mykey" {
  description = "Key for the Service Account created."
  value       = google_service_account_key.mykey
}
*/