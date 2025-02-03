resource "google_artifact_registry_repository" "repository" {
  location      = var.location
  repository_id = var.repository_id
  description   = var.description
  format        = var.format
  labels        = var.labels
  kms_key_name  = var.kms_key_name

  dynamic "docker_config" {
    for_each = var.docker_config != null ? [var.docker_config] : []
    content {
      immutable_tags = docker_config.value.immutable_tags
    }
  }
}