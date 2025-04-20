# module "dev-eks" {
#     #source = "../terraform-aws-vpc"
#     # source = "git::https://github.com/OpsInfinity/vpc.git?ref=main"
#     source = "git::https://github.com/OpsInfinity/aws.git//Eks?ref=main" 
#     env                       = "dev"
#     project_name              = "expense"
#     subnet_ids                = module.vpc.private_subnet_ids 
#     instance_types            = ["t3.medium"]
# }

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "chowdary-hari"
    key    = "env/dev/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "dev-eks" {
  source         = "git::https://github.com/OpsInfinity/aws.git//Eks?ref=main"
  env            = "dev"
  project_name   = "expense"
  subnet_ids     = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  instance_types = ["t3.medium"]
}

output "vpc_remote_state" {
  value = data.terraform_remote_state.vpc.outputs
}

