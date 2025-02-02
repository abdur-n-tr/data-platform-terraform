terraform {
  backend "gcs" {
    bucket         = "terraform-backend-dev-prj-udp-dev-qic"
    prefix         = "state"
  }
}
