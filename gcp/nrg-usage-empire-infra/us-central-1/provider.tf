

provider "google" {
  credentials = "alloydb-project-key.json"
  project     = "alloydb-project-463306-463410"
  # region      = "us-central1"
}

provider "google-beta" {
  credentials = "alloydb-project-key.json"
  project     = "alloydb-project-463306-463410"
  # region      = "us-central1"
}