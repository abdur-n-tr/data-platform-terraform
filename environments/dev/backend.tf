terraform {
  backend "gcs" {
    bucket         = "${var.backend_bucket}-${var.env}-${var.project_id}"
    prefix         = "state"
  }
}
