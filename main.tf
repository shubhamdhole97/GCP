provider "google" {
  credentials = file("${path.module}/account.json")
  project     = "absolute-hub-460713-v0"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_compute_instance" "hello_vm" {
  name         = "hello-world-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}  # Required for external IP
  }
}
