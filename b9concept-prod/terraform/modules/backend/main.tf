terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Simple DynamoDB table for now
resource "aws_dynamodb_table" "main" {
  name         = "b9concept-health-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "PK"
  range_key    = "SK"

  attribute {
    name = "PK"
    type = "S"
  }
  attribute {
    name = "SK"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = var.app_kms_key_arn
  }
}

output "api_endpoint_url" {
  value = "https://placeholder.execute-api.${var.aws_region}.amazonaws.com"
}

output "cognito_pool_id" {
  value = "placeholder-pool-id"
}
