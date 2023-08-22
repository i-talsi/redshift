variable "app_name" {
    type = string
    description = "application name"
    default = "poc"
}

variable "app_environment" {
    type = string
    description = "application environment dev/int/prod"
    default = "dev"
}

variable "redshift_cluster_identifier" {
  type        = string
  description = "Redshift Provisioned cluster name"
}

variable "redshift_provisioned_node_type" {
  type        = string
  description = "Redshift Provisioned node type (RA3.xlplus, RA3.4xl, RA3.16x, dc2.large, dc2.8xlarge)"
}

variable "redshift_provisioned_number_of_nodes" {
  type        = number
  description = "Redshift Provisioned number of nodes"
}

variable "redshift_provisioned_database_name" { 
  type        = string
  description = "Redshift Provisioned Database Name"
}

variable "redshift_provisioned_admin_username" {
  type        = string
  description = "Redshift Provisioned Admin Username"
}

variable "redshift_provisioned_password_length" {
    type = number
    description = "redshift admin password length"
    default = 15
}

variable "redshift_provisioned_kms_alias" {
  type        = string
  description = "Redshift Provisioned KMS Alias"
}

variable "redshift_provisioned_publicly_accessible" {
  type        = bool
  description = "Set the Redshift Provisioned to be Publicly Accessible"
  default     = false
}

variable "redshift_provisioned_vpc_cidr" {
  type        = string
  description = "VPC IPv4 CIDR"
}

variable "redshift_provisioned_subnet_1_cidr" {
  type        = string
  description = "IPv4 CIDR for Redshift subnet 1"
}

variable "redshift_provisioned_subnet_2_cidr" {
  type        = string
  description = "IPv4 CIDR for Redshift subnet 2"
}

variable "redshift_provisioned_subnet_3_cidr" {
  type        = string
  description = "IPv4 CIDR for Redshift subnet 3"
}

variable "redshift_provisioned_subnet_group_name" {
  type        = string
  description = "redshift provisioned subnet group id"
}

variable "redshift_provisioned_subnet_group_description" {
  type        = string
  description = "redshift provisioned subnet group description"
}

variable "redshift_provisioned_logging" {
  description = "Logging configuration for the cluster"
  type = any
  default = {}
}