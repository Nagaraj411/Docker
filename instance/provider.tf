terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket       = "docker411" # This should match the bucket in your S3 bucket
    key          = "docker"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true

  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1" # Specify the AWS region
}