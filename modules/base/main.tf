module "vpc" {
  # source  = "terraform-aws-modules/vpc/aws"
  # version = "6.6.1"
  # for extra security using the commit hash of version
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc?ref=7a28ce8ec6a17a8ca52710e47763f3a52c155110"
  name   = "${var.platform}-${data.aws_region.current.region}"
  cidr   = var.cidr

  azs = local.azs

  # Subnets
  private_subnets = [for k, v in local.azs : cidrsubnet(var.cidr, var.newbits, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.cidr, var.newbits, k + var.az_count)]

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  private_subnet_tags = {
    Purpose = "kubernetes"
  }

  public_subnet_tags = {
    Purpose = "dmz"
  }

  secondary_cidr_blocks = var.secondary_cidr_blocks

  # Default VPC adoption
  manage_default_vpc            = var.manage_default_vpc
  manage_default_security_group = var.manage_default_security_group

  # Cloudwatch log group and IAM role will be created
  enable_flow_log                      = var.enable_flow_log
  create_flow_log_cloudwatch_log_group = var.create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.create_flow_log_cloudwatch_iam_role

}
