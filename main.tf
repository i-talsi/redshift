terraform {
  backend "s3" {
    bucket = "talsii-projects"
    key = "redshift/serverless.state"
    region = "eu-west-1"
  }
  
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

module "./module/redshift_serverless" {
  source                                  = "./redshift_serverless"
  app_name                                = var.app_name
  app_environment                         = var.app_environment
  
  redshift_serverless_vpc_cidr            = var.redshift_serverless_vpc_cidr
  redshift_serverless_subnet_1_cidr       = var.redshift_serverless_subnet_1_cidr
  redshift_serverless_subnet_2_cidr       = var.redshift_serverless_subnet_2_cidr
  redshift_serverless_subnet_3_cidr       = var.redshift_serverless_subnet_3_cidr
  
  redshift_serverless_namespace_name      = var.redshift_serverless_namespace_name
  redshift_serverless_database_name       = var.redshift_serverless_database_name
  redshift_serverless_admin_username      = var.redshift_serverless_admin_username
  redshift_serverless_password_length     = var.redshift_serverless_password_length
  redshift_serverless_workgroup_name      = var.redshift_serverless_workgroup_name
  redshift_serverless_base_capacity       = var.redshift_serverless_base_capacity
  redshift_serverless_publicly_accessible = var.redshift_serverless_publicly_accessible
  redshift_serverless_kms_alias           = var.redshift_serverless_kms_alias
}
