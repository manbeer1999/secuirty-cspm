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

