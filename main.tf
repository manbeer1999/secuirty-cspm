provider "aws" {
  region = "us-east-1"
}

# Intentionally insecure S3 bucket (no encryption, public access)
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "manbeer-insecure-bucket-demo"
  acl    = "public-read"   # ⚠️ tfsec warning: public bucket

  tags = {
    Name = "InsecureBucket"
    Env  = "dev"
  }
}

# Security Group with wide open ingress (0.0.0.0/0)
resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Allow all inbound traffic - insecure example"
  vpc_id      = "vpc-123456"  # replace with your vpc id or dummy

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ⚠️ tfsec warning: unrestricted ingress
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
