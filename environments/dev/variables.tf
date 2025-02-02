variable "project_id" {
  description = "The ID of the project."
  type        = string
}

variable "location" {
  description = "The location for resources."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, stage, prod)."
  type        = string
}
