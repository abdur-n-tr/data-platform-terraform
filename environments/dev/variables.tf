variable "project_id" {
  description = "The ID of the project."
  type        = string
}

variable "location" {
  description = "The location for resources."
  type        = string
}

variable "region" {
  description = "The region where resources will be deployed."
  type        = string
}

variable "dev" {
  description = "The environment name (e.g., dev, stage, prod)."
  type        = string
}

variable "backend_bucket" {
  description = "Bucket name for remote backend."
  type        = string
  default     = "terraform-backend"
}
