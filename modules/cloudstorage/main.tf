resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  location                    = var.location
  project                     = var.project_id
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels                      = var.labels
  public_access_prevention    = var.public_access_prevention
  versioning {
    enabled = var.versioning
  }
}
