resource "aws_redshift_subnet_group" "this" {
  name        = coalesce(var.redshift_provisioned_subnet_group_name, var.redshift_cluster_identifier)
  description = var.redshift_provisioned_subnet_group_description
  subnet_ids  = [
                  aws_subnet.redshift_provisioned_subnet_az1.id,
                  aws_subnet.redshift_provisioned_subnet_az2.id,
                  aws_subnet.redshift_provisioned_subnet_az3.id
                ]
}

resource "aws_redshift_cluster" "this" {
  cluster_identifier                   = var.redshift_cluster_identifier
  database_name                        = var.redshift_provisioned_database_name
  master_username                      = var.redshift_provisioned_admin_username
  master_password                      = local.master_password
  node_type                            = var.redshift_provisioned_node_type
  number_of_nodes                      = var.redshift_provisioned_number_of_nodes
  allow_version_upgrade                = true
  apply_immediately                    = true
  encrypted                            = true
  automated_snapshot_retention_period  = 7
  kms_key_id                           = aws_kms_key.redshift_kms.arn
  cluster_type                         = var.redshift_provisioned_number_of_nodes > 1 ? "multi-node" : "single-node"
  enhanced_vpc_routing                 = false
  publicly_accessible                  = var.redshift_provisioned_publicly_accessible
  vpc_security_group_ids               = [ aws_security_group.redshift_provisioned_security_group.id ]
  cluster_subnet_group_name            = aws_redshift_subnet_group.this.name

  dynamic "logging" {
    for_each = can(var.redshift_provisioned_logging.enable) ? [var.redshift_provisioned_logging] : []

    content {
      bucket_name          = try(logging.value.bucket_name, null)
      enable               = logging.value.enable
      log_destination_type = try(logging.value.log_destination_type, null)
      log_exports          = try(logging.value.log_exports, null)
      s3_key_prefix        = try(logging.value.s3_key_prefix, null)
    }
  }
}

resource "aws_redshift_cluster_iam_roles" "this" {
  cluster_identifier   = aws_redshift_cluster.this.id
  iam_role_arns        = [aws_iam_role.redshift_provisioned_role.arn]
  default_iam_role_arn = aws_iam_role.redshift_provisioned_role.arn
}