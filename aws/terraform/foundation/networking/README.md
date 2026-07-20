# Terraform AWS Networking Module

## Overview

This module provisions a production-ready AWS Virtual Private Cloud (VPC) with a multi-AZ networking architecture following AWS best practices.

The module creates:

- VPC
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Route Table Associations
- VPC Flow Logs
- CloudWatch Log Group
- IAM Role and Policy for Flow Logs

The design is intended to serve as the networking foundation for workloads such as:

- Amazon EKS
- Amazon ECS
- EC2-based applications
- Amazon RDS
- Lambda functions running inside a VPC

---

# Architecture

```
                           Internet
                               │
                        Internet Gateway
                               │
                ┌──────────────┴──────────────┐
                │                             │
         Public Subnet AZ-A            Public Subnet AZ-B
                │                             │
                └────────── NAT Gateway ─────┘
                               │
          ┌────────────────────┴────────────────────┐
          │                                         │
  Private App Subnet AZ-A                  Private App Subnet AZ-B
          │                                         │
          └────────────────────┬────────────────────┘
                               │
                      Database Route Table
                               │
          ┌────────────────────┴────────────────────┐
          │                                         │
 Private Database Subnet AZ-A             Private Database Subnet AZ-B
```

---

# Resource Layout

| Resource | Count |
|----------|------:|
| VPC | 1 |
| Public Subnets | 2 |
| Private App Subnets | 2 |
| Private DB Subnets | 2 |
| Internet Gateway | 1 |
| NAT Gateway | 1 |
| Elastic IP | 1 |
| Route Tables | 3 |
| Route Table Associations | 6 |
| CloudWatch Log Group | 1 |
| IAM Role | 1 |
| IAM Policy | 1 |
| VPC Flow Log | 1 |

Total resources: **23**

---

# CIDR Layout

| Subnet | CIDR | Availability Zone |
|---------|------|-------------------|
| Public-1 | 10.0.1.0/24 | ap-south-1a |
| Public-2 | 10.0.2.0/24 | ap-south-1b |
| Private-App-1 | 10.0.11.0/24 | ap-south-1a |
| Private-App-2 | 10.0.12.0/24 | ap-south-1b |
| Private-DB-1 | 10.0.21.0/24 | ap-south-1a |
| Private-DB-2 | 10.0.22.0/24 | ap-south-1b |

---

# Features

- Multi-AZ networking
- Internet Gateway
- Private routing through NAT Gateway
- Dedicated database subnets
- VPC Flow Logs
- CloudWatch integration
- IAM least-privilege for Flow Logs
- Reusable Terraform module
- Environment-aware tagging

---

# Directory Structure

```
terraform-aws-networking/

├── versions.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── data.tf
├── vpc.tf
├── subnet_public.tf
├── subnet_private.tf
├── subnet_database.tf
├── internet_gateway.tf
├── eip.tf
├── nat_gateway.tf
├── route_tables.tf
├── route_table_association.tf
├── flow_logs.tf
├── outputs.tf
├── terraform.tfvars.example
├── README.md
└── examples/
    └── dev/
```

---

# Inputs

| Variable | Description | Type | Default |
|-----------|-------------|------|---------|
| aws_region | AWS Region | string | ap-south-1 |
| project_name | Project Name | string | Required |
| environment | Environment | string | Required |
| owner | Resource Owner | string | Required |
| vpc_cidr | VPC CIDR | string | 10.0.0.0/16 |
| enable_dns_support | Enable DNS | bool | true |
| enable_dns_hostnames | Enable Hostnames | bool | true |
| enable_flow_logs | Enable Flow Logs | bool | true |
| flow_log_retention_days | CloudWatch retention | number | 30 |

---

# Outputs

- VPC ID
- Internet Gateway ID
- NAT Gateway ID
- Public Subnet IDs
- Private Application Subnet IDs
- Private Database Subnet IDs
- Public Route Table ID
- Private Route Table ID
- Database Route Table ID

---

# Usage

```hcl
module "network" {

  source = "../.."

  aws_region = "ap-south-1"

  project_name = "isc"

  environment = "dev"

  owner = "iPrasad"

}
```

---

# Deployment

Initialize

```bash
terraform init
```

Format

```bash
terraform fmt -recursive
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Resource Dependency

```
VPC
│
├── Public Subnets
│      │
│      ├── Internet Gateway
│      ├── Elastic IP
│      └── NAT Gateway
│
├── Private App Subnets
│
├── Private DB Subnets
│
├── Route Tables
│
├── Route Table Associations
│
└── VPC Flow Logs
       │
       ├── IAM Role
       ├── IAM Policy
       └── CloudWatch Log Group
```

---

# Tagging Strategy

Every resource is tagged with:

- Project
- Environment
- Owner
- ManagedBy

Additional Name tags are assigned to all resources.

---

# Design Decisions

### Single NAT Gateway

This module currently deploys a single NAT Gateway to reduce costs in development environments.

Future enhancement:

- Configurable NAT Gateway per Availability Zone.

### Flow Logs

VPC Flow Logs are enabled by default and sent to CloudWatch Logs.

### Database Subnets

Database subnets are isolated from direct internet access.

---

# Future Enhancements

- Security Groups
- Network ACLs
- DB Subnet Group
- VPC Endpoints
- IPv6 Support
- Transit Gateway
- AWS Config
- CloudTrail
- GuardDuty
- Security Hub
- KMS Encryption
- Multi-region deployment

---

# Tested With

- Terraform v1.15.x
- AWS Provider v6.x
- AWS Region: ap-south-1

---

