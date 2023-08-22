terraform {
  backend "s3" {
    bucket = "talsii-projects"
    key = "redshift/provisioned.state"
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

module "redshift_provisioned" {
  source                                        = "../../modules/redshift_provisioned"
  
  app_name                                      = var.app_name
  app_environment                               = var.app_environment
  
  redshift_cluster_identifier                   = var.redshift_cluster_identifier
  redshift_provisioned_node_type                = var.redshift_provisioned_node_type
  redshift_provisioned_number_of_nodes          = var.redshift_provisioned_number_of_nodes
  redshift_provisioned_database_name            = var.redshift_provisioned_database_name
  redshift_provisioned_admin_username           = var.redshift_provisioned_admin_username
  redshift_provisioned_password_length          = var.redshift_provisioned_password_length
  redshift_provisioned_kms_alias                = var.redshift_provisioned_kms_alias
  redshift_provisioned_publicly_accessible      = var.redshift_provisioned_publicly_accessible
  redshift_provisioned_vpc_cidr                 = var.redshift_provisioned_vpc_cidr
  redshift_provisioned_subnet_1_cidr            = var.redshift_provisioned_subnet_1_cidr
  redshift_provisioned_subnet_2_cidr            = var.redshift_provisioned_subnet_2_cidr
  redshift_provisioned_subnet_3_cidr            = var.redshift_provisioned_subnet_3_cidr
  redshift_provisioned_subnet_group_name        = var.redshift_provisioned_subnet_group_name
  redshift_provisioned_subnet_group_description = var.redshift_provisioned_subnet_group_description
  redshift_provisioned_logging                  = var.redshift_provisioned_logging
}
