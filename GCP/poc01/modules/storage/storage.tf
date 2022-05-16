

resource "google_storage_bucket" "bucket" {
  name     = var.project_id
  project  = var.project_id
  location = var.region

  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

