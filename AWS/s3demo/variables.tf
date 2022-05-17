
variable "region" {
  description = "AWS Region"
  default     = "us-west-2" #oregon  # us-east-1 N.Virginia us-east-2 Ohio
}

variable "bucket_name" {
  description = "AWS Region"
  default     = "s3-tf-demo-emm"
}

variable "aws_profle" {
  description = "AWS Local Profile"
  default     = "terraform-operator" 
}

variable "vpc_cidr" {
  description = "AWS Local Profile"
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  description = "VPC sub net"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}