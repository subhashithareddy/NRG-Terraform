/*

# Create psc endpoint using alloydb psc attachment

resource "google_compute_address" "psc_consumer_address" {
  name    = "psc-consumer-address"
  project = var.attachment_project_id
  region  = var.region_central

  # subnetwork   = google_compute_subnetwork.psc_subnet.name
  subnetwork   = var.consumer_vpc_subnet_name
  address_type = "INTERNAL"
  # address      = "10.2.0.10"
  address      =  var.psc_endpoint_ip_address
}



######## Got this block from google ###################################
# resource "google_compute_forwarding_rule" "psc_consumer_fwd_rule" {
#   name    = "psc-consumer-fwd-rule"
#   region  = var.region_central
#   project = var.attachment_project_id

#   target                  = module.alloydb_central.primary_instance.psc_instance_config[0].service_attachment_link
#   load_balancing_scheme   = "INTERNAL"         # Fixed value required for PSC
#   network                 = google_compute_network.psc_vpc.name
#   ip_address              = google_compute_address.psc_consumer_address.id
#   allow_psc_global_access = true               # Optional, but commonly true for cross-region access
# }


resource "google_compute_forwarding_rule" "psc_consumer_fwd_rule" {
  name    = "psc-consumer-fwd-rule"
  region  = var.region_central
  project = var.attachment_project_id

 ## target                = module.alloydb_central.primary_instance.psc_instance_config[0].service_attachment_link
  target                  = module.nrg_usage_empire_alloy_db.primary_instance.psc_instance_config[0].service_attachment_link
  # load_balancing_scheme   = "" # need to override EXTERNAL default when target is a service attachment
  load_balancing_scheme   = "INTERNAL"
  network                 = var.consumer_vpc_name
  ip_address              = google_compute_address.psc_consumer_address.id
  allow_psc_global_access = true
}

resource "google_dns_managed_zone" "psc_consumer_dns_zone" {
  name    = "psc-consumer-dns-zone"
  project = var.attachment_project_id

#dns_name    = module.alloydb_central.primary_psc_dns_name
dns_name    = module.nrg_usage_empire_alloy_db.primary_psc_dns_name
  description = "DNS Zone for PSC access to Alloydb"
  visibility  = "private"
  private_visibility_config {
    networks {
      # network_url = google_compute_network.psc_vpc.id
      network_url = "projects/consumer-project-463506/global/networks/psc-endpoint-vpc"
    }
  }
}

resource "google_dns_record_set" "psc_consumer_dns_record" {
  name    = module.alloydb_central.primary_psc_dns_name
  project = var.attachment_project_id

  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.psc_consumer_dns_zone.name
  rrdatas      = [google_compute_address.psc_consumer_address.address]
}


*/