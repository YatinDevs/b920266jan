output "cloudfront_url" { value = module.frontend.cloudfront_url }
output "api_endpoint" { value = module.backend.api_endpoint_url }
output "cognito_pool_id" { value = module.backend.cognito_pool_id }
