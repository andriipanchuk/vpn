provider "google" {
  credentials = file("~/Downloads/cyber-pro-service-account.json")
  project     = var.google_project_id
  zone      = var.region
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      size = var.instance_disk_size
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network       = "default"
    access_config {
      // Public IP will be assigned to the instance.
    }
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  metadata_startup_script = <<EOF
#!/bin/bash
sudo git clone https://github.com/andriipanchuk/vpnset /usr/local/sbin
sudo sed -i 's/ChangeMePlease/19909524z/g' /usr/local/sbin//vpnsetup.sh
sudo sh /usr/local/sbin/vpnsetup.sh
EOF
}
