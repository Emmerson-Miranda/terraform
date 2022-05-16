#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic
resource "google_pubsub_topic" "gcr" {
  #name = "projects/$PROJECT/topics/gcr"
  name = "gcr"
  project = var.project_id
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription
resource "google_pubsub_subscription" "gcr-triggers" {
  name  = "gcr-triggers"
  topic = google_pubsub_topic.gcr.name
}

/*
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription_iam
data "google_iam_policy" "admin" {
  binding {
    role = "roles/pubsub.subscriber"
    members = [
      "serviceAccount:${var.sa.email}",
    ]
  }
}

resource "google_pubsub_subscription_iam_policy" "gcr-subscriber-policy" {
  subscription = "gcr-triggers"
  policy_data  = data.google_iam_policy.admin.policy_data
}
*/