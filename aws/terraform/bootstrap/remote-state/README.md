Purpose

Creates Terraform backend resources.

Resources

- S3 bucket
- DynamoDB table

Deployment

terraform init
terraform apply

After creation

Configure backend blocks in every Terraform stack.