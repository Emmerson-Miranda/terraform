
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