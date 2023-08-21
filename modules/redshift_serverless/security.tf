resource "random_password" "master_password" {
  length           = var.redshift_serverless_password_length
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "serverless_admin_sercet" {
  name = "redshift_serverless_api"
}

resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.serverless_admin_sercet.id
  secret_string = <<EOF
   {
    "username": ${var.redshift_serverless_admin_username},
    "password": ${local.master_password}
   }
EOF
}

resource "aws_iam_role" "redshift_serverless_role" {
  name = "redshift_serverless_role"

assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "redshift.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "Redshift"
    }
  ]
}
EOF
  tags = {
    Name        = "redshift_serverless_role"
    Environment = var.app_environment
  }
}

resource "aws_iam_role_policy" "redshift_s3_full_access_policy" {
  name = "redshift_serverless_role_s3_policy"
  role = aws_iam_role.redshift_serverless_role.id

policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Action": "s3:*",
       "Resource": "*"
      }
   ]
}
EOF
}

data "aws_iam_policy" "redshift_full_access_policy" {
  name = "AmazonRedshiftAllCommandsFullAccess"
}

resource "aws_iam_role_policy_attachment" "attach_s3" {
  role       = aws_iam_role.redshift_serverless_role.name
  policy_arn = data.aws_iam_policy.redshift_full_access_policy.arn
}