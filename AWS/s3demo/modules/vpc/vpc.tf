data "aws_availability_zones" "available" {
  
}


data "aws_subnets" "list" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.name}"
  cidr = "${var.cidr}" 
  azs = data.aws_availability_zones.available.names

  private_subnets = "${var.private_subnets}"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    terraform = "true"
  }

}


resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.${var.region}.s3"

  //subnet_ids          = data.aws_subnets.list.ids //Subnet IDs are only supported for Interface and GatewayLoadBalancer type VPC Endpoints.
  private_dns_enabled = false

   policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
        Principal = "*"
      },
    ]
  })

  tags = {
    Name = "demos3"
    terraform = "true"
  }
}