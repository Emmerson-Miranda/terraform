output "azs" {
  value = data.aws_availability_zones.available.names
  description = "List of AWS AZs within the region"
}

output "vpc" {
  value = module.myvpc
  description = "AWS VPC"
}