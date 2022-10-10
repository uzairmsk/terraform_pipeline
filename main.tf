provider "google" {
  project="agile-polymer-364709"
  region="us-east1"
  zone="us-east1-b"
}

resource "google_compute_network" "vpc_network" {
  project                 = "agile-polymer-364709"
  name                    = "vpc-network-terraform"
  auto_create_subnetworks = false
  mtu                     = 1460
}
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-central1"
  network       = "vpc-network-terraform"
}
resource "google_service_account" "service_account" {
  account_id   = "uzairshaikh02982"
  display_name = "Uzair Account 2"
}
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    
    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope andasdasd permissions granted via IAM Roles.
    email  = "uzair-service-account@agile-polymer-364709.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}