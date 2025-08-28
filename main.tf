terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-security-cspm-demo-bucket-12345"
  acl    = "private"

  tags = {
    Name        = "CSPM-Demo"
    Environment = "Dev"
  }
}


