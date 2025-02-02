# variable "batch_bucket" {
#   description = "Bucket storing batched Parquet files after processing."
#   type        = string
#   default     = "p6-batch"
# }

# variable "extract_bucket" {
#   description = "Bucket storing raw API extracts before batching."
#   type        = string
#   default     = "p6-extract"
# }

# variable "dataset_id" {
#   description = "BigQuery dataset for storing raw Oracle P6 API extracts before processing."
#   type        = string
#   default     = "oracle_p6_dataset"
# }

# variable "data_type" {
#   description = "Type of data stored (e.g., 'raw', 'processed')."
#   type        = string
#   default     = "raw"
# }

variable "project_id" {
  description = "The ID of the project."
  type        = string
}

variable "location" {
  description = "The location for resources."
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, prod)."
  type        = string
}

variable "bq_schemas" {
  description = "Directory for bigquery table schemas."
  type        = string
  default     = "bq_schemas"
}
