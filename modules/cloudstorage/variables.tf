variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket."
  type        = string
  default     = "STANDARD"
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access."
  type        = bool
  default     = true
}

variable "labels" {
  description = "A map of labels to apply to the bucket."
  type        = map(string)
  default     = {}
}

variable "public_access_prevention" {
  description = "Specifies whether public access prevention is enabled for the bucket."
  type        = string
  default     = "enforced"
}

variable "versioning" {
  description = "Specifies whether versioning is enabled for the bucket."
  type        = bool
  default     = true
}
