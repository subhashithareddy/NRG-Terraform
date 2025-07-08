env                                           = "qa"
region                                        = "us-central1"
project_id                                    = "alloydb-project-463306-463410"


nrg_usage_empire_cluster_id                   = "my-alloydb-cluster-qa"
nrg_usage_empire_cluster_location             = "us-central1"
nrg_usage_empire_cluster_labels = {
              environment                     = "qa"
              owner                           = "usageempire"
}
database_version                              = "POSTGRES_16"


psc_enabled                                   = "true"
psc_allowed_consumer_projects                 = ["144097428147"]



primary_instance = {
  instance_id                                 = "my-alloydb-instance-qa"
  database_flags  = {
    "alloydb.enable_auto_explain"             = "on"
    "alloydb.enable_pg_cron"                  = "on"
    "alloydb.enable_pg_hint_plan"             = "on"
    "alloydb.enable_pg_squeeze"               = "on"
    "alloydb.enable_pg_wait_sampling"         = "on"
    "auto_explain.log_analyze"                = "on"
    "auto_explain.log_buffers"                = "on"
    "auto_explain.log_min_duration"           = "1000"
    "auto_explain.log_nested_statements"      = "on"
    "auto_explain.log_timing"                 = "on"
    "google_db_advisor.auto_advisor_schedule" = "EVERY 48 HOURS"
    "google_db_advisor.enable_auto_advisor"   = "on"
    "log_lock_waits"                          = "on"
    "log_min_messages"                        = "notice"
    "max_connections"                         = "5000"
    "max_wal_size"                            = "20480"
    "min_wal_size"                            = "10240"
    "pg_stat_statements.track"                = "all"
    "track_counts"                            = "on"
  }
  labels = {
    env                                       = "qa"
    team                                      = "usageempire"
  }
  # gce_zone                                    = "us-central1-a"
  availability_type                           = "REGIONAL"
  machine_cpu_count                           = 2
  # machine_type                              = "db-custom-4-8192"
  ssl_mode                                    = "ENCRYPTED_ONLY"
  require_connectors                          = false
  enable_public_ip                            = false
  enable_outbound_public_ip                   = false

  query_insights_config = {
    query_string_length                       = 1024
    record_application_tags                   = true
    record_client_address                     = false
    query_plans_per_minute                    = 5
  }
}


cluster_initial_user ={
  user= "subhash"
  password= "changeme"
}

read_pool_instance = [
  {
    instance_id                                 = "my-alloydb-instance-qa-readpool1"
    display_name                                = "Read Pool Instance 1"
    node_count                                  = 2
    database_flags  = {
      "alloydb.enable_auto_explain"             = "on"
      "alloydb.enable_pg_cron"                  = "on"
      "alloydb.enable_pg_hint_plan"             = "on"
      "alloydb.enable_pg_squeeze"               = "on"
      "alloydb.enable_pg_wait_sampling"         = "on"
      "auto_explain.log_analyze"                = "on"
      "auto_explain.log_buffers"                = "on"
      "auto_explain.log_min_duration"           = "1000"
      "auto_explain.log_nested_statements"      = "on"
      "auto_explain.log_timing"                 = "on"
      "google_db_advisor.auto_advisor_schedule" = "EVERY 48 HOURS"
      "google_db_advisor.enable_auto_advisor"   = "on"
      "log_lock_waits"                          = "on"
      "log_min_messages"                        = "notice"
      "max_connections"                         = "5000"
      "max_wal_size"                            = "20480"
      "min_wal_size"                            = "10240"
      "pg_stat_statements.track"                = "all"
      "track_counts"                            = "on"
  }
    machine_cpu_count                           = 2
    # machine_type       = "db-custom-4-16384"
    ssl_mode                                    = "ENCRYPTED_ONLY"
    require_connectors                          = false
    enable_public_ip                            = false
    enable_outbound_public_ip                   = false
    query_insights_config = {
      query_string_length                       = 1024
      record_application_tags                   = true
      record_client_address                     = true
      query_plans_per_minute                    = 5
    }
  },
  {
    instance_id                                 = "my-alloydb-instance-qa-readpool2"
    display_name                                = "Read Pool Instance 2"
    node_count                                  = 2
    database_flags  = {
    "alloydb.enable_auto_explain"               = "on"
    "alloydb.enable_pg_cron"                    = "on"
    "alloydb.enable_pg_hint_plan"               = "on"
    "alloydb.enable_pg_squeeze"                 = "on"
    "alloydb.enable_pg_wait_sampling"           = "on"
    "auto_explain.log_analyze"                  = "on"
    "auto_explain.log_buffers"                  = "on"
    "auto_explain.log_min_duration"             = "1000"
    "auto_explain.log_nested_statements"        = "on"
    "auto_explain.log_timing"                   = "on"
    "google_db_advisor.auto_advisor_schedule"   = "EVERY 48 HOURS"
    "google_db_advisor.enable_auto_advisor"     = "on"
    "log_lock_waits"                            = "on"
    "log_min_messages"                          = "notice"
    "max_connections"                           = "5000"
    "max_wal_size"                              = "20480"
    "min_wal_size"                              = "10240"
    "pg_stat_statements.track"                  = "all"
    "track_counts"                              = "on"
  }
  labels = {
    env                                         = "qa"
    team                                        = "usageempire"
  }
  # gce_zone                                    = "us-central1-a"
  availability_type                             = "REGIONAL"
  machine_cpu_count                             = 2
  # machine_type                                = "db-custom-4-8192"
  ssl_mode                                      = "ENCRYPTED_ONLY"
  require_connectors                            = false
  enable_public_ip                              = false
  enable_outbound_public_ip                     = false

  query_insights_config = {
    query_string_length                         = 1024
    record_application_tags                     = true
    record_client_address                       = false
    query_plans_per_minute                      = 5
  }
  }
]





# ###############  PSC Consumer project related variables  ################## 
attachment_project_number = "144097428147"
attachment_project_id     = "consumer-project-463506"
# region_central            = "us-central1"
# consumer_vpc_subnet_name  = "psc-endpoint-subnet"
# psc_endpoint_ip_address   = "10.2.0.10"
# consumer_vpc_name         = "psc-endpoint-vpc"