provider "aws" {
  region = var.aws_region
  shared_credentials_files = ["/home/ishuagrawal/.aws/credentials"]
  profile = "terraform"
  
}