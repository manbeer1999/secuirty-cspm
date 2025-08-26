terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "rand" { byte_length = 4 }

resource "aws_s3_bucket" "logs" {
  bucket = "${var.project}-logs-${random_id.rand.hex}"
  tags = {
    Owner       = "security"
    Environment = "dev"
  }
}

resource "aws_ssm_parameter" "api_key" {
  name  = "/${var.project}/api_key"
  type  = "SecureString"
  value = "change-me"
}
