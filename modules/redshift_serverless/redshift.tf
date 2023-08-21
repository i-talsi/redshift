resource "aws_redshiftserverless_namespace" "serverless" {
  namespace_name      = var.redshift_serverless_namespace_name
  db_name             = var.redshift_serverless_database_name
  admin_username      = var.redshift_serverless_admin_username
  admin_user_password = local.master_password
  iam_roles           = [aws_iam_role.redshift_serverless_role.arn]
  kms_key_id          = aws_kms_key.redshift_kms.arn


  tags = {
    Name        = var.redshift_serverless_namespace_name
    Environment = var.app_environment
  }
}

resource "aws_redshiftserverless_workgroup" "serverless" {
  depends_on = [aws_redshiftserverless_namespace.serverless]

  namespace_name = aws_redshiftserverless_namespace.serverless.id
  workgroup_name = var.redshift_serverless_workgroup_name
  base_capacity  = var.redshift_serverless_base_capacity
  
  security_group_ids = [ aws_security_group.redshift_serverless_security_group.id ]
  subnet_ids         = [ 
    aws_subnet.redshift_serverless_subnet_az1.id,
    aws_subnet.redshift_serverless_subnet_az2.id,
    aws_subnet.redshift_serverless_subnet_az3.id,
  ]
  publicly_accessible = var.redshift_serverless_publicly_accessible
  
  tags = {
    Name        = var.redshift_serverless_workgroup_name
    Environment = var.app_environment
  }
}