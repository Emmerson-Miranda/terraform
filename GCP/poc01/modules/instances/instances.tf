# google_compute_instance.tf-instance-1:
# $terraform taint module.instances.google_compute_instance.tf-instance-1
resource "google_compute_instance" "tf-instance-1" {
    #allow_stopping_for_update = true #important when you want to change machine type

    can_ip_forward          = false
    deletion_protection     = false
    enable_display          = false
    machine_type            = "n1-standard-1"
    name                    = "tf-instance-1"
    project                 = var.project_id
    zone                    = var.zone

    boot_disk {
        auto_delete = true
        device_name = "boot"
        mode        = "READ_WRITE"
        
        initialize_params {
            image  = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-10-buster-v20210316"
            size   = 10
            type   = "pd-standard"
        }
    }
    
    network_interface {
        #network            = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/default" 
        network    = var.network
        #subnetwork         = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${var.region}/subnetworks/default" 
        subnetwork = var.subnetwork01
        #subnetwork_project = var.project_id 

        access_config {
        }
    }
    
}

# google_compute_instance.tf-instance-2:
# $terraform taint module.instances.google_compute_instance.tf-instance-2
resource "google_compute_instance" "tf-instance-2" {
    #allow_stopping_for_update = true #important when you want to change machine type
    
    can_ip_forward          = false
    deletion_protection     = false
    enable_display          = false
    machine_type            = "n1-standard-1"
    name                    = "tf-instance-2"
    project                 = var.project_id
    zone                    = var.zone

    boot_disk {
        auto_delete = true
        device_name = "boot"
        mode        = "READ_WRITE"
        
        initialize_params {
            image  = "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-10-buster-v20210316"
            size   = 10
            type   = "pd-standard"
        }
    }
    
    network_interface {
        #network            = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/default" 
        network    = var.network
        #subnetwork         = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/regions/${var.region}/subnetworks/default" 
        subnetwork = var.subnetwork02
        #subnetwork_project = var.project_id 
        
        access_config {
        }
    }
  
}
