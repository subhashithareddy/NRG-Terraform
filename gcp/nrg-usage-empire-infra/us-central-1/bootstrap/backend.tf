
# terraform {
#   backend "gcs" {
#     bucket = "usage-empire-terraform-bucket"
#     prefix = "terraform/state"
#     credentials = "alloydb-project-key.json"
#   }
# }


/*
terraform {
  backend "gcs" {

  }
}
*/





##  export GOOGLE_CLOUD_KEYFILE_JSON="$(pwd)/cft-training.json"
##  export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CLOUD_KEYFILE_JSON