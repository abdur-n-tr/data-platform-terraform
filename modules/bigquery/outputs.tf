output "dataset_id" {
  description = "The ID of the created BigQuery dataset."
  value       = google_bigquery_dataset.dataset.dataset_id
}

output "table_ids" {
  description = "The IDs of the created BigQuery tables."
  value       = [for table in google_bigquery_table.tables : table.table_id]
}