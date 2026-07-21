terraform {
  backend "s3" {
    bucket       = "cloud-playground-dev-730933263564-terraform-state"
    key          = "foundation/networking/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}