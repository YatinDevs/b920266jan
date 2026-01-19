variable "project_prefix" {
  description = "Unique prefix for all resources (e.g., b9concept)"
  type        = string
}

variable "primary_region" {
  description = "Primary AWS region for backend (e.g., us-east-1)"
  type        = string
}

variable "domain_name" {
  description = "Custom domain name (e.g., B9Concept.com)"
  type        = string
}

variable "apigateway_regional_hosted_zone_ids" {
  description = "API Gateway Hosted Zone IDs by region"
  type        = map(string)
  default = {
    "us-east-1"     = "Z1YQ0QG1TRY2M9"
    "us-east-2"     = "ZO4S8DV22WSPB"
    "us-west-1"     = "Z1YDDYS3Y1R573"
    "us-west-2"     = "Z2OJLY241G159A"
    "eu-central-1"  = "Z268G4S22G420R"
    "eu-west-1"     = "ZJ5UAJN8Y3Z2Q"
    "eu-west-2"     = "Z1BFK98MPE037V"
  }
}
