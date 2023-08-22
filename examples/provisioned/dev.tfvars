aws_region                                      = "eu-west-1"
app_name                                        = "poc"
app_environment                                 = "dev"

redshift_provisioned_vpc_cidr                   = "10.30.0.0/16"
redshift_provisioned_subnet_1_cidr              = "10.30.1.0/24"
redshift_provisioned_subnet_2_cidr              = "10.30.2.0/24"
redshift_provisioned_subnet_3_cidr              = "10.30.3.0/24"
redshift_provisioned_subnet_group_name          = "poc-subnet-group"
redshift_provisioned_subnet_group_description   = "poc subnet group"

redshift_cluster_identifier                     = "poc-cluster"
redshift_provisioned_node_type                  = "RA3.4xlarge"
redshift_provisioned_number_of_nodes            = 4
redshift_provisioned_database_name              = "dev"
redshift_provisioned_admin_username             = "admin"
redshift_provisioned_password_length            = 15
redshift_provisioned_kms_alias                  = "alias/redshift-provisioned-kms"
redshift_provisioned_publicly_accessible        = false
redshift_provisioned_logging                    = {}
