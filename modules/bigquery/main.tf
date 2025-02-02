# Create a BigQuery Dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.friendly_name
  project                     = var.project_id
  location                    = var.location
  description                 = var.dataset_description
  labels                      = var.dataset_labels
  default_table_expiration_ms = var.default_table_expiration_ms
  delete_contents_on_destroy  = var.delete_contents_on_destroy
}

# Create BigQuery Tables
resource "google_bigquery_table" "tables" {
  for_each = var.tables

  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.key
  project    = var.project_id
  labels     = var.table_labels

  schema = file(each.value.schema_file)

  time_partitioning {
    type  = each.value.time_partitioning.type
    field = each.value.time_partitioning.field
  }

  clustering = each.value.clustering

  expiration_time = each.value.expiration_time
}