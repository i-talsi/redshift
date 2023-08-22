resource "aws_kms_key" "redshift_kms" {
  description             = "This key is used to encrypt redshift data"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true
}

resource "aws_kms_alias" "redshift_kms_alias" {
  name          = var.redshift_provisioned_kms_alias
  target_key_id = aws_kms_key.redshift_kms.id
}