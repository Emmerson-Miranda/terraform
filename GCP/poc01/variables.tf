variable "project_id" {
  description = "The project ID to host the network in"
  default     = "<PROJECT-ID>" #export PROJECT=$(gcloud info --format='value(config.project)')
}

variable "region" {
  description = "GCP Region"
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-central1-a"
}

variable "network" {
  description = "VM's Network"
  default     = "default"
}

variable "subnetwork01" {
  description = "VM's subnetwork"
  default     = "default"
}

variable "subnetwork02" {
  description = "VM's subnetwork"
  default     = "default"
}

 
