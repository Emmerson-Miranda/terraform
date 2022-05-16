#with the default node pool

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "bucket-spinnaker" {
  name     = "${var.project_id}-spinnaker-config"
  project  = var.project_id
  location = var.region
  storage_class = "REGIONAL"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "bucket-manifests" {
  name     = "${var.project_id}-kubernetes-manifests"
  project  = var.project_id
  location = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}


#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam


/*
data "google_iam_policy" "admin" {
  binding {
    role = "roles/storage.admin"
    members = [
      "serviceAccount:${var.sa.email}",
    ]
  }
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#google_project_iam_policy
resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}
*/