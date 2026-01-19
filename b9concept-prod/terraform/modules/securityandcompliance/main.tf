terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_kms_key" "app_cmk" {
  description             = "B9Concept app CMK"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_kms_alias" "app_cmk" {
  name          = "alias/b9concept-app-cmk"
  target_key_id = aws_kms_key.app_cmk.key_id
}

output "app_kms_key_arn" {
  value = aws_kms_key.app_cmk.arn
}
