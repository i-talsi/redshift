aws_region                              = "eu-west-1"
app_name                                = "poc"
app_environment                         = "dev"

redshift_serverless_vpc_cidr            = "10.20.0.0/16"
redshift_serverless_subnet_1_cidr       = "10.20.1.0/24"
redshift_serverless_subnet_2_cidr       = "10.20.2.0/24"
redshift_serverless_subnet_3_cidr       = "10.20.3.0/24"

redshift_serverless_namespace_name      = "poc-namespace"
redshift_serverless_database_name       = "dev"
redshift_serverless_admin_username      = "admin"
redshift_serverless_password_length     = 15
redshift_serverless_workgroup_name      = "poc-workgroup"
redshift_serverless_base_capacity       = 32
redshift_serverless_publicly_accessible = false
redshift_serverless_kms_alias           = "alias/redshift-serverless-kms"