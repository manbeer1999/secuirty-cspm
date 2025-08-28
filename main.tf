provider "aws" {
  region     = "us-east-1"
  access_key = "hardcoded-access-key"
  secret_key = "hardcoded-secret-key"
}

resource "aws_s3_bucket" "bad_example" {
  bucket = "insecure-bucket-example"
  acl    = "public-read"   
}
