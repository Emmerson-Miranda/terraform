variable "project_id" {
  description = "The project ID to host the network in"
}

variable "user_account" {
  description = "User account to bind with k8s cluster" #export USER_ACCOUNT=$(gcloud config get-value account)
}

variable "sa" {
  description = "Service Account Object"
}

variable "region" {
  description = "GCP Region"
}

variable "zone" {
  description = "GCP Zone"
}

variable "network" {
  description = "VM's Network"
}

variable "subnetwork01" {
  description = "VM's subnetwork"
}


 
