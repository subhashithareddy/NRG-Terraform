provider "google" {
  credentials = "alloydb-project-key.json"
  # project     = var.project_id
  region      = var.region
}

provider "google-beta" {
  credentials = "alloydb-project-key.json"
  # project     = var.project_id
  region      = var.region
}