variable "secret_id" {
  description = "The ID of the secret."
  type        = string
}

variable "labels" {
  description = "Labels to attach to the secret."
  type        = map(string)
  default     = {}
}

variable "replica_locations" {
  description = "List of locations for secret replication."
  type        = list(string)
}