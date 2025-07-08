
# resource "google_compute_network" "psc_vpc" {
#   name    = "psc-endpoint-vpc"
#   project = var.attachment_project_id
# }

# resource "google_compute_subnetwork" "psc_subnet" {
#   project       = var.attachment_project_id
#   name          = "psc-endpoint-subnet"
#   ip_cidr_range = "10.2.0.0/16"
#   region        = var.region_central
#   network       = google_compute_network.psc_vpc.id
# }

# # Create attachment for testing psc interfaces
# resource "google_compute_network_attachment" "psc_attachment" {
#   provider    = google-beta
#   name        = "psc-network-attachment"
#   region      = var.region_central
#   description = "PSC network attachment for PSC testing interface"
#   project     = var.attachment_project_id

#   subnetworks           = [google_compute_subnetwork.psc_subnet.id]
#   connection_preference = "ACCEPT_AUTOMATIC"
# }


