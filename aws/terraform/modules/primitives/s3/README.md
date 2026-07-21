# S3 Primitive Module

## Purpose

Creates a production-ready Amazon S3 bucket following AWS security best practices.

## Resources

- S3 Bucket
- Bucket Ownership Controls
- Public Access Block
- Server-side Encryption (AES256)
- Bucket Versioning

## Features

- Secure by default
- Public access disabled
- Versioning supported
- Terraform managed

## Inputs

| Name | Description |
|------|-------------|
| bucket_name | Unique bucket name |
| project_name | Project |
| environment | Environment |
| force_destroy | Allow deleting non-empty bucket |
| enable_versioning | Enable bucket versioning |
| tags | Additional tags |

## Outputs

- bucket_id
- bucket_name
- bucket_arn
- bucket_regional_domain_name

## Example

```hcl
module "s3" {

  source = "../../modules/primitives/s3"

  bucket_name = "example-bucket"

  project_name = "Cloud Playground"

  environment = "dev"

}
```