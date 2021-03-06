provider "google" {
  credentials = "${file("/home/andri/cyber-pro-service-account.json")}"
  project     = "${var.google_project_id}"
  zone        = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      size = "${var.instance_disk_zie}" 
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }

  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }



metadata_startup_script = <<EOF
  #!/bin/bash
  git clone https://github.com/andriipanchuk/vpnset /usr/local/sbin
  sudo sh /usr/local/sbin/vpnsetup.sh
 
EOF
}
