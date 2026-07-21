# CloudFront Primitive Module

## Purpose

Creates a reusable Amazon CloudFront distribution with secure default settings.

## Resources

- CloudFront Distribution

## Features

- HTTPS redirect
- HTTP/2 and HTTP/3
- IPv6 enabled
- AWS managed cache policy
- AWS managed origin request policy
- Compression enabled
- Secure by default

## Inputs

- distribution_name
- origin_id
- origin_domain_name
- project_name
- environment
- price_class
- tags

## Outputs

- distribution_id
- distribution_arn
- distribution_domain_name
- hosted_zone_id
- etag