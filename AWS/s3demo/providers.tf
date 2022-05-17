
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5"
    }
  }

  backend "local" {
    path = "terraform/state/terraform.tfstate"
  }

}

provider "aws" {
  region = var.region
  profile = var.aws_profle
}