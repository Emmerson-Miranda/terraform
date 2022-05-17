
data "aws_availability_zones" "available" {
  
}

# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------

module "myvpc" {
  source = "./modules/vpc"
  name   = "poc-access-point"
  cidr   = var.vpc_cidr
  private_subnets = var.vpc_private_subnets
  region = var.region
}

# ---------------------------------------------------------------------------------------------------------------------
# IAM 
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_iam_group" "training" {
  name = "training"
  path = "/demos3/"
}

resource "aws_iam_user" "user1" {
  name = "user1"
  path = "/demos3/"

  tags = {
    type = "mypoc"
  }
}

resource "aws_iam_user_group_membership" "user1_training" {
  user = aws_iam_user.user1.name

  groups = [
    aws_iam_group.training.name,
  ]
}

resource "aws_iam_policy" "demo_assume_role_policy" {
  name        = "demo_assume_role_policy"
  path        = "/demos3/"
  description = "My Demo S3 Assume Role Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_policy" "access_point_policy" {
  name        = "access_point_policy"
  path        = "/demos3/"
  description = "My Demo S3 Access Point Role Policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "s3-object-lambda:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_role" "demos3role" {
  name = "demos3role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# EC2
# ---------------------------------------------------------------------------------------------------------------------

/*
module "server_sts" {
  source = "./modules/ec2"
  # us-west-2 Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2
  ami           = "ami-0ca285d4c2cda3300" 
  instance_type = "t2.micro"
  subnet_id = module.myvpc.subnets.ids[0]
  name = "server_sts"
}

module "client_sts" {
  source = "./modules/ec2"
  # us-west-2 Amazon Linux 2 Kernel 5.10 AMI 2.0.20220426.0 x86_64 HVM gp2
  ami           = "ami-0ca285d4c2cda3300" 
  instance_type = "t2.micro"
  subnet_id = module.myvpc.subnets.ids[1]
}
*/


/*
module "s3-bucket-demo-emm" {
  source     = "./modules/s3bucket"
  name       = var.bucket_name
  region     = var.region
  aws_profle = var.aws_profle
}

*/

