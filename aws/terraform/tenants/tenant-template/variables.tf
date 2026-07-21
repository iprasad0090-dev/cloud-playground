variable "tenant_name" {
  description = "Tenant name."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "enable_versioning" {
  description = "Enable bucket versioning."
  type    = bool
  default = true
}

variable "force_destroy" {
  description = "Allow bucket deletion even when it contains objects."
  type    = bool
  default = false
}