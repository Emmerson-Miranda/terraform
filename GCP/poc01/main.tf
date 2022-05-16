terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  /*
  backend "gcs" {
    bucket  = var.project_id #write here the project id
    prefix  = "terraform/state"
  }
  */

  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }
}

/*
#$ terraform import google_compute_instance.default projects/{{project}}/zones/{{zone}}/instances/{{name}}
#$ terraform import google_compute_instance.tf-instance-1 projects/${GOOGLE_CLOUD_PROJECT}/zones/us-central1-a/instances/tf-instance-1
#$ terraform import google_compute_instance.tf-instance-2 projects/${GOOGLE_CLOUD_PROJECT}/zones/us-central1-a/instances/tf-instance-2

resource "google_compute_instance" "tf-instance-1" {}

resource "google_compute_instance" "tf-instance-2" {}
*/

module "instances" {
  source       = "./modules/instances"
  project_id   = var.project_id
  region = var.region
  zone = var.zone
  network = var.network
  subnetwork01 = var.subnetwork01
  subnetwork02 = var.subnetwork02
}


module "storage" {
  source       = "./modules/storage"
  project_id   = var.project_id
  region = var.region
  zone = var.zone
}


/*
# $ terraform init
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "2.5.0"

    project_id   = var.project_id
    network_name = "terraform-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.11.11.0/24"
            subnet_region         = var.region
        }
    ]
}
*/

/*
# permit the vpc network to allow ingress connections on all IP ranges (0.0.0.0/0) on TCP port 80.
resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = google_compute_network.terraform-vpc.name # put here the real name
  source_ranges = [ "0.0.0.0/0" ]
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["web"]
}
*/
