variable "location" {
  description = "The location of the Artifact Registry repository."
  type        = string
}

variable "repository_id" {
  description = "The ID of the Artifact Registry repository."
  type        = string
}

variable "description" {
  description = "A description for the Artifact Registry repository."
  type        = string
  default     = ""
}

variable "format" {
  description = "The format of the repository (e.g., DOCKER, MAVEN, NPM, PYTHON, APT, YUM)."
  type        = string
  default     = "DOCKER"
}

variable "labels" {
  description = "A map of labels to apply to the repository."
  type        = map(string)
  default     = {}
}

variable "kms_key_name" {
  description = "The Cloud KMS key name to use for encryption. If not provided, Google-managed encryption will be used."
  type        = string
  default     = null
}

variable "docker_config" {
  description = "Configuration for Docker repositories. Set to null for non-Docker repositories."
  type = object({
    immutable_tags = bool
  })
  default = null
}