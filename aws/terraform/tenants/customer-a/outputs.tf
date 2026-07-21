output "bucket_name" {
  description = "Tenant bucket name"
  value       = module.static_site.bucket_name
}

output "distribution_id" {
  description = "CloudFront Distribution ID"
  value       = module.static_site.distribution_id
}

output "distribution_domain_name" {
  description = "CloudFront Distribution Domain Name"
  value       = module.static_site.distribution_domain_name
}