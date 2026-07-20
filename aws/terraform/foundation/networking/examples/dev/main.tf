module "network" {
  source = "../.."

  aws_region   = "ap-south-1"
  project_name = "demo"
  environment  = "dev"
  owner        = "platform"
}
