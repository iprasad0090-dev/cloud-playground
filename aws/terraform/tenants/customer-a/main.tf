module "static_site" {

  source = "../../modules/solutions/static-site"

  bucket_name = local.ui_bucket_name

  project_name = var.project_name
  environment  = var.environment

  enable_versioning = var.enable_versioning
  force_destroy     = var.force_destroy

  oac_name             = local.ui_oac_name
  distribution_comment = local.ui_distribution_comment

  tags = local.common_tags
}