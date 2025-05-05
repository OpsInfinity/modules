terraform {
  backend "s3" {
    bucket         = "chowdary-hari"
    key            = "env/dev/sg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
