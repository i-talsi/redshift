# AWS Availability Zones data
data "aws_availability_zones" "available" {}

######################################

# Create the VPC
resource "aws_vpc" "redshift_serverless_vpc" {
  cidr_block           = var.redshift_serverless_vpc_cidr
  enable_dns_hostnames = true
  
  tags = {
    Name        = "redshift_serverless_vpc"
    Environment = var.app_environment
  }
}

######################################

resource "aws_subnet" "redshift_serverless_subnet_az1" {
  vpc_id            = aws_vpc.redshift_serverless_vpc.id
  cidr_block        = var.redshift_serverless_subnet_1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = {
    Name        = "redshift_serverless_subnet_az1"
    Environment = var.app_environment
  }
}

resource "aws_subnet" "redshift_serverless_subnet_az2" {
  vpc_id            = aws_vpc.redshift_serverless_vpc.id
  cidr_block        = var.redshift_serverless_subnet_2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  
  tags = {
    Name        = "redshift_serverless_subnet_az2"
    Environment = var.app_environment
  }
}

resource "aws_subnet" "redshift_serverless_subnet_az3" {
  vpc_id            = aws_vpc.redshift_serverless_vpc.id
  cidr_block        = var.redshift_serverless_subnet_3_cidr
  availability_zone = data.aws_availability_zones.available.names[2]
  
  tags = {
    Name        = "redshift_serverless_subnet_az3"
    Environment = var.app_environment
  }
}

resource "aws_security_group" "redshift_serverless_security_group" {
  name        = "redshift_serverless_security_group"
  description = "redshift serverless security group"

  vpc_id = aws_vpc.redshift_serverless_vpc.id

  ingress {
    description = "Redshift port"
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    #tfsec:ignore:#tfsec:ignore:aws_vpc_no_public_ingress_sgr
    cidr_blocks = [var.redshift_serverless_vpc_cidr]
  }

  tags = {
    Name        = "redshift_security_group"
    Environment = var.app_environment
  }
}
