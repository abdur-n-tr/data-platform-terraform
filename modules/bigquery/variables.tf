# Dataset Variables
variable "dataset_id" {
  description = "The ID of the BigQuery dataset."
  type        = string
}

variable "friendly_name" {
  description = " A descriptive name for the dataset."
  type        = string  
  default     = ""
}

variable "project_id" {
  description = "The ID of the project where the dataset will be created."
  type        = string
}

variable "location" {
  description = "The geographic location of the dataset."
  type        = string
}

variable "dataset_description" {
  description = "A description for the dataset."
  type        = string
  default     = ""
}

variable "dataset_labels" {
  description = "A map of labels to apply to the dataset."
  type        = map(string)
  default     = {}
}

variable "default_table_expiration_ms" {
  description = "The default expiration time for tables in the dataset (in milliseconds)."
  type        = number
  default     = null
}

variable "delete_contents_on_destroy" {
  description = "Whether to delete all tables in the dataset when the dataset is destroyed."
  type        = bool
  default     = false
}

# Table Variables
variable "tables" {
  description = "A map of tables to create in the dataset. Each table should have a schema file and optional configurations."
  type = map(object({
    schema_file       = string
    time_partitioning = object({
      type  = string
      field = string
    })
    clustering        = list(string)
    expiration_time   = number
  }))
  default = {}
}

variable "table_labels" {
  description = "A map of labels to apply to all tables."
  type        = map(string)
  default     = {}
}