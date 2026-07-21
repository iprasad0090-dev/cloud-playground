variable "origin_id" {
  description = "Origin identifier."
  type        = string
}

variable "origin_access_control_id" {
  description = "CloudFront Origin Access Control ID."
  type        = string
}

variable "origin_domain_name" {
  description = "Origin domain name."
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

variable "enabled" {
  description = "Enable distribution."
  type        = bool
  default     = true
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Environment."
  type        = string
}

variable "distribution_comment" {
  description = "CloudFront distribution comment."
  type        = string
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}