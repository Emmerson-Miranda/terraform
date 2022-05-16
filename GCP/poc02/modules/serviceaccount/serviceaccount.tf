#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "spinnaker-account" {
  project = var.project_id
  account_id   = "spinnaker-account"
  display_name = "spinnaker-account"
}

/*
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_key
resource "google_service_account_key" "mykey" {
  service_account_id = google_service_account.spinnaker-account.name
}
*/