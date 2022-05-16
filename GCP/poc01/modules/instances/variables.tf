variable "project_id" {
  description = "The project ID to host the network in"
}

variable "region" {
  description = "GCP Region"
}

variable "zone" {
  description = "GCP Zone"
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
