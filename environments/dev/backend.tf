terraform {
  backend "gcs" {
    bucket         = "terraform-backend-dev-calm-seeker-443408-f2"
    prefix         = "state"
  }
}
