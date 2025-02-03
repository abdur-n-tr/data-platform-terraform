module "oracle_p6" {
  source = "../../modules/data_sources/oracle_p6"
  project_id    = var.project_id
  location      = var.location
  env           = var.env
}
