###############################################
# CloudFront Distribution
###############################################

module "cloudfront" {

  source = "../../primitives/cloudfront"

  origin_id = local.origin_id

  origin_domain_name = module.s3.bucket_regional_domain_name

  origin_access_control_id = aws_cloudfront_origin_access_control.this.id

  distribution_comment = var.distribution_comment

  default_root_object = var.default_root_object

  price_class = var.price_class

  project_name = var.project_name

  environment = var.environment

  tags = local.common_tags

}