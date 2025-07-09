terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~>6.42.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "~>6.42.0"
    }
  }
  required_version = "1.12.2"
}