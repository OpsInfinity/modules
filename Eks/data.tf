data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "chowdary-hari"
    key    = "env/dev/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}