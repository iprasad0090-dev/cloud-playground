variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

variable "project_name" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Environment."
  type        = string
}

variable "force_destroy" {
  description = "Allow bucket deletion with objects."
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable bucket versioning."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional resource tags."
  type        = map(string)
  default     = {}
}

variable "sse_algorithm" {

  description = "Default server-side encryption algorithm."
  type        = string
  default     = "AES256"
  validation {
    condition = contains(
      ["AES256", "aws:kms"],
      var.sse_algorithm
    )
    error_message = "Supported values are AES256 or aws:kms."
  }
}