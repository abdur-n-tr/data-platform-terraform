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