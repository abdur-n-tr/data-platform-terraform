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
  source = "../../modules/bigquery"

  dataset_id  = "oracle_p6_dataset"
  project_id  = var.project_id
  location    = var.location
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
    }
    tasks = {
      schema_file = "${path.module}/${var.bq_schemas}/tasks.json"
      time_partitioning = {
        type  = "DAY"
        field = "due_date"
      }
      clustering      = ["task_id"]
      expiration_time = null
    }
  }
}