###############################################
# AWS Managed Cache Policy
###############################################

data "aws_cloudfront_cache_policy" "managed" {

  name = "Managed-CachingOptimized"

}

###############################################
# AWS Managed Origin Request Policy
###############################################

data "aws_cloudfront_origin_request_policy" "managed" {

  name = "Managed-CORS-S3Origin"

}