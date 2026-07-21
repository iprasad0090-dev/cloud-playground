###############################################
# General
###############################################

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Environment."
  type        = string
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}

###############################################
# Static Site
###############################################

variable "bucket_name" {
  description = "Static website bucket name."
  type        = string
}

variable "default_root_object" {
  description = "Default root object."
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_200"
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

variable "distribution_comment" {
  description = "CloudFront distribution comment."
  type        = string
}

variable "oac_name" {
  description = "Origin Access Control name."
  type        = string
}