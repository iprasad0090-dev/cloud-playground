###############################################
# CloudFront Distribution
###############################################

resource "aws_cloudfront_distribution" "this" {

  enabled             = var.enabled
  is_ipv6_enabled     = true
  http_version        = "http2and3"
  default_root_object = var.default_root_object
  price_class         = var.price_class
  wait_for_deployment = false
  comment             = var.distribution_comment

  origin {

    domain_name              = var.origin_domain_name
    origin_id                = var.origin_id
    origin_access_control_id = var.origin_access_control_id

  }

  default_cache_behavior {

    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    compress = true

    cache_policy_id = data.aws_cloudfront_cache_policy.managed.id

    origin_request_policy_id = data.aws_cloudfront_origin_request_policy.managed.id

  }

  restrictions {

    geo_restriction {

      restriction_type = "none"

    }

  }

  ###############################################
  # TODO:
  # Replace with ACM certificate when
  # custom domains are introduced.
  ###############################################

  viewer_certificate {

    cloudfront_default_certificate = true

  }

  tags = local.common_tags

}