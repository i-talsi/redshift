# redshift
This repos provide TF code for provisioning redshift clusters and redshift serverless endpoints

# deploy a serverless endpoint
The TF code will provision:
- KMS key used for redshift at rest encryption
- IAM role assumed by redshift
- VPC, subnets (3) and security group
- Admin password stored in Secret Manager
- Redshift Serverless namespace
- Redshift Serverless workgroup
  
