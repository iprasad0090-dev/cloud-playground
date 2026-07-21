locals {

  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )

  origin_id = "${var.project_name}-${var.environment}-origin"

}