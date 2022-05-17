output "vpc" {
  description = "AWS VPC"
  value       = module.vpc
}

output "subnets" {
  description = "AWS Subnets"
  value       = data.aws_subnets.list
}