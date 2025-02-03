terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.18.1"
    }
  }
  required_version = ">= 1.5"
}

provider "google" {
  project = var.project_id  
  region  = var.location
}