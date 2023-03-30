variable "instance_name" {
  default = "vpn1"
  description = "- (Optional) Give an any name on bastion host"
}

variable "google_project_id" {
  default = "turing-energy-378521"
  description = "- (Optional) That is gonna be used for our particular project ID in GCP"  
}

variable "zone" {
  default = "us-central1-c"
  description = "- (Optional) Here we are specified in which A-Z suppose to be our bastion host"  
}

variable "region" {
  default = "us-central1"
  description = "- (Optional) Here we are specified in which A-Z suppose to be our bastion host"  
}

variable "machine_type" {
  default = "e2-micro"
  description = "- (Optional) VM instance, including the system memory size, virtual CPU, and persistent disk limits" 
}





variable "gce_ssh_user" {
  default = "andri"
  description =  "- (Optional) That's will use for entry via ssh to the bastion host" 
}

variable "gce_ssh_pub_key_file" {
  default = "~/.ssh/id_rsa.pub"
  description = "- (Optional) Here is will be a choosing an access method to bastion host"  
}

variable "instance_disk_size" {
  default = "10" 
  description = "- (Optional) The disk size for the bastion host <example 30 40 50 >"
}

