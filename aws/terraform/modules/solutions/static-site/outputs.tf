###############################################
# S3 Outputs
###############################################

output "bucket_id" {

  description = "S3 Bucket ID"

  value = module.s3.bucket_id

}

output "bucket_name" {

  description = "S3 Bucket Name"

  value = module.s3.bucket_name

}

###############################################
# CloudFront Outputs
###############################################

output "distribution_id" {

  description = "CloudFront Distribution ID"

  value = module.cloudfront.distribution_id

}

output "distribution_arn" {

  description = "CloudFront Distribution ARN"

  value = module.cloudfront.distribution_arn

}

output "distribution_domain_name" {

  description = "CloudFront Distribution Domain Name"

  value = module.cloudfront.distribution_domain_name

}

output "hosted_zone_id" {

  description = "CloudFront Hosted Zone ID"

  value = module.cloudfront.hosted_zone_id

}