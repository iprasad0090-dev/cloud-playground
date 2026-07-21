
variable "app_instance_type" {
  description = "EC2 instance type for Application"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}