# Tenant Template

Reusable deployment template for a tenant.

This stack deploys:

- Static website
- Amazon S3
- Amazon CloudFront
- Origin Access Control (OAC)

This template should be copied when onboarding a new tenant.

Example:

tenants/
├── tenant-template
├── tenant-acme
├── tenant-contoso