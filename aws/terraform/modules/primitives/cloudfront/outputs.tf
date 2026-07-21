output "distribution_id" {

  description = "CloudFront Distribution ID"

  value = aws_cloudfront_distribution.this.id

}

output "distribution_arn" {

  description = "CloudFront Distribution ARN"

  value = aws_cloudfront_distribution.this.arn

}

output "distribution_domain_name" {

  description = "CloudFront Domain Name"

  value = aws_cloudfront_distribution.this.domain_name

}

output "hosted_zone_id" {

  description = "CloudFront Hosted Zone ID"

  value = aws_cloudfront_distribution.this.hosted_zone_id

}