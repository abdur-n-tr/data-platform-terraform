resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret_id
  labels    = var.labels

  replication {
    user_managed {
      dynamic "replicas" {
        for_each = var.replica_locations
        content {
          location = replicas.value
        }
      }
    }
  }
}