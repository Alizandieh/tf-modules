locals {
  bridge_nodes_subnet_ids = [
    for s in data.aws_subnet.private :
    s.id if s.availability_zone == "eu-west-1a"
  ]
  devops_nodes_subnet_ids = [
    for s in data.aws_subnet.private :
    s.id if s.availability_zone == "eu-west-1b"
  ]
}


module "eks" {
  # source  = "terraform-aws-modules/eks/aws"
  # version = "~> 21.15.1"
  # for extra security using the commit hash of version
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=8a833809b9314a57d93b08597679fd4b2ea2af65"

  name                                 = "${var.platform}-${data.aws_region.current.region}"
  kubernetes_version                   = var.cluster_version
  endpoint_public_access               = var.cluster_endpoint_public_access
  security_group_additional_rules      = var.security_group_additional_rules
  node_security_group_additional_rules = var.node_security_group_additional_rules
  create_cloudwatch_log_group          = var.create_cloudwatch_log_group
  enabled_log_types                    = var.enabled_log_types

  # EKS Addons
  addons = var.cluster_addons

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  self_managed_node_groups = {
    bridge_nodes = {
      subnet_ids    = local.bridge_nodes_subnet_ids
      ami_type      = var.ami_type
      ami_id        = var.ami_id
      instance_type = var.bridge_nodes_instance_type

      min_size          = var.bridge_nodes_min_size
      max_size          = var.bridge_nodes_max_size
      desired_size      = var.bridge_nodes_desired_size
      enable_monitoring = var.bridge_nodes_enable_monitoring

      user_data_template_path      = var.user_data_template_path
      iam_role_additional_policies = var.node_iam_role_additional_policies

      metadata_options = {
        http_put_response_hop_limit = 2
      }

      block_device_mappings = {
        xvda = { # Root volume
          device_name = "/dev/xvda"
          ebs = {
            volume_size = var.node_root_volume_size
            volume_type = "gp3"
          }
        }
      }
    },
    devops_nodes = {
      subnet_ids    = local.devops_nodes_subnet_ids
      ami_type      = var.ami_type
      ami_id        = var.ami_id
      instance_type = var.devops_nodes_instance_type

      min_size          = var.devops_nodes_min_size
      max_size          = var.devops_nodes_max_size
      desired_size      = var.devops_nodes_desired_size
      enable_monitoring = var.devops_nodes_enable_monitoring

      user_data_template_path      = var.user_data_template_path
      iam_role_additional_policies = var.node_iam_role_additional_policies

      metadata_options = {
        http_put_response_hop_limit = 2
      }

      block_device_mappings = {
        xvda = { # Root volume
          device_name = "/dev/xvda"
          ebs = {
            volume_size = var.node_root_volume_size
          }
        }
      }
    }
  }

  access_entries = {
    # IAM role with admin access
    cross-account-devops = {
      principal_arn = var.cluster_admin_role_arn

      # Associate with cluster admin policy
      policy_associations = {
        cluster-admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }

    }
  }
  tags = var.tags
}
