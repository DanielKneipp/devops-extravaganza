terraform {
  required_version = "~> 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.44.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "backspace-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a"]
  public_subnets  = ["10.0.100.0/24"]
  private_subnets = ["10.0.1.0/24"]

  enable_nat_gateway = true
}

module "server" {
  source = "./modules/ec2"

  prefix    = "backspace"
  ami       = "ami-05d7cb15bfbf13b6d" # CentOS Linux 8 us-east-1
  subnet_id = module.vpc.private_subnets[0]
}
