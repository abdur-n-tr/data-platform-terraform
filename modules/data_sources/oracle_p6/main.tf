module "batch_bucket" {
  source = "../../cloudstorage"

  bucket_name = "p6-batch-raw-${var.env}-${var.project_id}"
  location    = var.location
  project_id  = var.project_id
}

module "extract_bucket" {
  source = "../../cloudstorage"

  bucket_name = "p6-extract-raw-${var.env}-${var.project_id}"
  location    = var.location
  project_id  = var.project_id
}

module "bigquery" {
  source = "../../bigquery"

  dataset_id  = "oracle_p6_dataset"
  project_id  = var.project_id
  location    = var.location
  delete_contents_on_destroy = true
  dataset_description = "Dataset for Oracle P6 data."
  dataset_labels = {
    env  = "dev"
    type = "silver"
    source = "p6"
  }

  table_labels = {
    env  = "dev"
    type = "silver"
    source = "p6"
  }

  tables = {
    projects = {
      schema_file = "${path.module}/${var.bq_schemas}/projects.json"
      time_partitioning = {
        type  = "DAY"
        field = "start_date"
      }
      clustering      = ["project_id"]
      expiration_time = null
      deletion_protection = false
    }
    tasks = {
      schema_file = "${path.module}/${var.bq_schemas}/tasks.json"
      deletion_protection = false
    }
  }
}

module "artifact_registry_docker" {
  source = "../../artifact_registry"

  location      = var.location
  repository_id = "oracle-p6-${var.env}-${var.project_id}"
  description   = "Docker repository for Oracle P6 images"
  format        = "DOCKER"
  labels = {
    env  = var.env
    type = "docker"
    source = "p6"
  }
}

module "p6_api_username" {
  source = "../../secret_manager"

  secret_id         = "P6_API_USERNAME"
  labels            = {
    env  = var.env
    type = "secret"
    source = "p6"
  }
  replica_locations = [var.location]
}

module "p6_api_password" {
  source = "../../secret_manager"

  secret_id         = "P6_API_PASSWORD"
  labels            = {
    env  = var.env
    type = "secret"
    source = "p6"
  }
  replica_locations = [var.location]
}

module "cloud_run_job" {
  source = "./modules/cloud_run_job"

  job_name    = "p6-cloud-run-job"
  location    = var.location
  image       = "${var.location}-docker.pkg.dev/${var.project_id}/${module.artifact_registry_docker.repository_id}/p6-job-quickstart:latest"
  parallelism = 10
  task_count  = 16
  deletion_protection = false
  container_cpu = "1"
  container_memory = "1Gi"
  task_timeout = "24h"
  max_retries = 1

  labels = {
    env  = var.env
    type = "cloud-run-job"
    source = "p6"
  }

  env_vars = {
    GCS_BUCKET_NAME = "gs://p6-demo-data-abdurrehman"
    API_ENDPOINT    = "https://ksa1.p6.oraclecloud.com/qic/pds/rest-service/dataservice/runquery?configCode=ds_p6adminuser"
    PAGE_SIZE       = "2000"
    SLEEP_MS        = "5"
    MAX_API_CALLS   = "1"
  }
}