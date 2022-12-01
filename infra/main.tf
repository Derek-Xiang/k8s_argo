provider "google" {
  project = "derek-xiang-sandbox"
  region  = var.region
  zone    = var.zone
}


resource "google_service_account" "default" {
  account_id   = var.svc_account_config.account_id
  display_name = var.svc_account_config.display_name
}


resource "google_container_cluster" "primary" {
  name     = var.cluster_info.name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 2
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_info.name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
