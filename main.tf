terraform {
 
    # backend "gcs" {
    #     bucket = "terraform-ysalaun"
    #     prefix = "terraform/state"
    # }
 
    backend "local" {
        
    }

    required_providers {
        google = {
            source = "google"
            version = "~> 4.81"
        }
    }
}
 
provider "google" {
    project = "oa-bta-learning-dv"
    region = "us-central1"  
    zone = "us-central1-c"
}
 
resource "google_compute_network" "vpc_network" {
    name = "terraform-network-ysa"
}
 
resource "google_compute_address" "static_ip" {
    name = "terraform-static-ip-ysa"
}
 
output "ip" {
    value = google_compute_address.static_ip.address
}