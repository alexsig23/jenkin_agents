provider "google" {
  project = "alexgaskell-sandbox"
  region  = "europe-west1"
  zone    = "europe-west1-c"
}


# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "jenkins-agent"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  tags         = ["ssh", "node", "terraform", "executer"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -y docker"

  network_interface {
    subnetwork = "jenkins-agents"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
