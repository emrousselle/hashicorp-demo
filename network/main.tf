terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.49.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"

  tags = { 
    Name = "${var.sdlc_environment} VPC"
    Environment = var.sdlc_environment
    Sensitive = var.secret_value
  }

}

resource "aws_subnet" "app_1" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "App1 Subnet (${var.sdlc_environment})"
    Environment = var.sdlc_environment
  }
}
