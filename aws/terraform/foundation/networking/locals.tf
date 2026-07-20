locals {

  name_prefix = "${var.project_name}-${var.environment}"

  azs = length(var.availability_zones) > 0 ? var.availability_zones : slice(
    data.aws_availability_zones.available.names,
    0,
    2
  )

  public_subnets = {
    for idx, az in local.azs :
    az => var.public_subnet_cidrs[idx]
  }

  private_app_subnets = {
    for idx, az in local.azs :
    az => var.private_app_subnet_cidrs[idx]
  }

  private_db_subnets = {
    for idx, az in local.azs :
    az => var.private_db_subnet_cidrs[idx]
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }

}