locals {

  common_tags = {

    Tenant      = var.tenant_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"

  }

  resource_prefix = "${var.project_name}-${var.tenant_name}"
  ui_bucket_name = "${local.resource_prefix}-ui"
  ui_origin_id = "${local.resource_prefix}-ui-origin"
  ui_oac_name = "${local.resource_prefix}-ui-oac"
  ui_distribution_comment = "${local.resource_prefix}-ui-cdn"

}