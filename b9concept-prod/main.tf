terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  alias  = "primary"
  region = var.primary_region
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"
}

module "security" {
  source    = "./terraform/modules/securityandcompliance"
  providers = { aws = aws.primary }
}

module "backend" {
  source         = "./terraform/modules/backend"
  providers      = { aws = aws.primary }
  depends_on     = [module.security]
  app_kms_key_arn = module.security.app_kms_key_arn  # ✅ ADDED
  aws_region      = var.primary_region               # ✅ ADDED
}

module "frontend" {
  source    = "./terraform/modules/frontend"
  providers = { aws = aws.global }
  depends_on = [module.backend]
  domain_name = var.domain_name
}