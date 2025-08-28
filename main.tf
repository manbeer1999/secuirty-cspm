terraform {
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

# Example: Insecure Security Group (tfsec should flag open 0.0.0.0/0 ingress)
resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Security group with open ingress"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # <-- tfsec will warn
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Example: S3 bucket without encryption (tfsec should flag)
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-insecure-bucket-${random_id.rand.hex}"
  acl    = "public-read"   # <-- tfsec will warn
}

resource "random_id" "rand" {
  byte_length = 4
}
