variable "name" {
  description = "Instance name"
}

variable "ami" {
  description = "AMI"
}

variable "instance_type" {
  description = "Instance type"
}

variable "subnet_id" {
  description = "Subnet where to create the EC2 Instance"
}
