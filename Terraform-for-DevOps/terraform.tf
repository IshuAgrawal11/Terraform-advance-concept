terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.34.0"
    }
  }

  backend "s3" {
    bucket = "ishuagrawal-bucket-state"
    key = "terraform.tfstate"
    region = "eu-north-1"
    use_lockfile = false
  }
}