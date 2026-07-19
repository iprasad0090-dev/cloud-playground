variable "aws_region" {
  description = "AWS Region"

  type = string

  default = "ap-south-1"
}

variable "project_name" {
  description = "Project Name"

  type = string
}

variable "environment" {
  description = "Deployment Environment"

  type = string

  validation {
    condition = contains(
      ["dev", "qa", "uat", "prod"], var.environment
    )

    error_message = "Environment must be one of dev, qa, uat or prod."
  }
}

variable "owner" {
  description = "Resource Owner"

  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"

  type = string

  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Enable DNS Support"

  type = bool

  default = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"

  type = bool

  default = true
}

################################################################################
# Availability Zones
################################################################################

variable "availability_zones" {
  description = "Availability Zones to use. Leave empty to automatically select the first two AZs."

  type = list(string)

  default = []
}

################################################################################
# Public Subnets
################################################################################

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"

  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

################################################################################
# Private Application Subnets
################################################################################

variable "private_app_subnet_cidrs" {
  description = "CIDR blocks for private application subnets"

  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

################################################################################
# Private Database Subnets
################################################################################

variable "private_db_subnet_cidrs" {
  description = "CIDR blocks for private database subnets"

  type = list(string)

  default = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]
}

variable "enable_flow_logs" {
  description = "Enable VPC Flow Logs"

  type    = bool
  default = true
}

variable "flow_log_retention_days" {
  description = "CloudWatch Log retention"

  type    = number
  default = 30
}