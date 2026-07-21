###############################################
# Static Site Bucket
###############################################

module "s3" {

  source = "../../primitives/s3"

  bucket_name  = var.bucket_name
  project_name = var.project_name
  environment  = var.environment
  tags         = local.common_tags
  enable_versioning = var.enable_versioning
  force_destroy     = var.force_destroy
  sse_algorithm = "AES256"

}