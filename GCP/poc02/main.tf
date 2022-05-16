terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}

/*
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform

data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "spinnaker-tutorial"
  location = "us-central1"
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
*/

module "serviceaccount" {
  source       = "./modules/serviceaccount"
  project_id   = var.project_id
}


module "pubsub" {
  source       = "./modules/pubsub"
  project_id   = var.project_id
  sa = module.serviceaccount.sa
  region = var.region
  zone = var.zone
}



module "storage" {
  source       = "./modules/storage"
  project_id   = var.project_id
  sa = module.serviceaccount.sa
  region = var.region
}



module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  region = var.region
  zone = var.zone
  network = var.network
  subnetwork01 = var.subnetwork01
  user_account = var.user_account
  sa = module.serviceaccount.sa
}
