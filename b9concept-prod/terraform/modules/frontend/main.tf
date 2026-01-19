terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "frontend" {
  bucket = "b9concept-frontend-${var.domain_name}"
}

output "cloudfront_url" {
  value = "d1234567890.cloudfront.net"
}
