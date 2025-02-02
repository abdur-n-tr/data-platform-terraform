module "batch_bucket" {
  source = "../../cloudstorage"

  bucket_name = "${var.batch_bucket}-${var.data_type}-${var.env}-${var.project_id}"
  location    = var.location
  project_id  = var.project_id
}

module "extract_bucket" {
  source = "../../cloudstorage"

  bucket_name = "${var.extract_bucket}-${var.data_type}-${var.env}-${var.project_id}"
  location    = var.location
  project_id  = var.project_id
}
