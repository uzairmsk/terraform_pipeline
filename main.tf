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
  ip_cidr_range = "10.0.6.0/16"
  region        = "us-central1"
  network       = "vpc-network-terraform"
}