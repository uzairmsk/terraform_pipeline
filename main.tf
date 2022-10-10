provider "google" {
  project="agile-polymer-364709"
  region="us-east1"
  zone="us-east1-b"
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
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "uzair-service-account@agile-polymer-364709.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}