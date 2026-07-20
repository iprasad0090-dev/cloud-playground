locals {

  name_prefix = "${var.project_name}-${var.environment}"

  bucket_prefix = replace(lower(var.project_name), "_", "-")

  bucket_name = "${local.bucket_prefix}-${var.environment}-${data.aws_caller_identity.current.account_id}-terraform-state"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}