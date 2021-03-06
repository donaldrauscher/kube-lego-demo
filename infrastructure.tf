variable "project" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-f"
}

provider "google" {
  version = "~> 1.5"
  project = "${var.project}"
  region = "${var.region}"
}

resource "google_compute_global_address" "test-static-ip" {
  name = "test-static-ip"
}

resource "google_container_cluster" "test-cluster" {
  name = "test-cluster"
  zone = "${var.zone}"
  initial_node_count = "1"
  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = ["https://www.googleapis.com/auth/devstorage.read_only"]
  }
}
