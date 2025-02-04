variable "job_name" {
  description = "Name of the Cloud Run job."
  type        = string
}

variable "location" {
  description = "Location for the Cloud Run job."
  type        = string
}

variable "image" {
  description = "Container image for the job."
  type        = string
}

variable "parallelism" {
  description = "Number of tasks to run in parallel."
  type        = number
  default     = 1
}

variable "task_count" {
  description = "Number of tasks to run."
  type        = number
  default     = 1
}

variable "env_vars" {
  description = "Environment variables as a map."
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels to attach to the cloud run job."
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Whether Terraform will be prevented from destroying the job?"
  type        = bool
  default     = true
}

variable "container_cpu" {
  description = "Number of CPU units for the container"
  type        = string
  default     = "0.1"  
}

variable "container_memory" {
  description = "Amount of memory for the container"
  type        = string
  default     = "128Mi"  
}

variable "container_name" {
  description = "Name of the container."
  type        = string
  default     = null
}

variable "task_timeout" {
  description = "Max duration a task (in seconds) can run before being killed (e.g., '3.5s')"
  type        = string
  default     = "60s"
}

variable "task_service_account" {
  description = "IAM service account email for the task"
  type        = string
  default     = null
}

variable "task_max_retries" {
  description = "Max retries allowed before marking the task as failed"
  type        = number
  default     = 2  
}
