output "repository_id" {
  description = "The ID of the created Artifact Registry repository."
  value       = google_artifact_registry_repository.repository.repository_id
}

output "name" {
  description = "The fully qualified name of the repository."
  value       = google_artifact_registry_repository.repository.name
}

output "location" {
  description = "The location of the repository."
  value       = google_artifact_registry_repository.repository.location
}

output "format" {
  description = "The format of the repository."
  value       = google_artifact_registry_repository.repository.format
}