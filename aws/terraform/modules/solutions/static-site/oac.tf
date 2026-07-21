###############################################
# Origin Access Control
###############################################

resource "aws_cloudfront_origin_access_control" "this" {

  name = var.oac_name
  description = "Origin Access Control for ${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"

}