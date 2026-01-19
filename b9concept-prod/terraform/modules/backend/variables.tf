variable "app_kms_key_arn" {
  description = "KMS key ARN from security module"
  type        = string
}

variable "aws_region" {
  description = "AWS region for backend resources"
  type        = string
}
