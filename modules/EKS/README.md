# EKS

The purpose of this module is to provide a EKS cluster in the specifed VPC.

## Use case example
```
module "saha_eks" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/EKS?ref=40c4680" --> this is the commit hash
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.28.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_eks"></a> [eks](#module\_eks) | git::https://github.com/terraform-aws-modules/terraform-aws-eks | 8a833809b9314a57d93b08597679fd4b2ea2af65 |

## Resources

| Name | Type |
| ---- | ---- |
| [aws_availability_zones.region_azs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The AMI from which to launch the instance | `string` | `""` | no |
| <a name="input_ami_type"></a> [ami\_type](#input\_ami\_type) | The AMI type to use for the node group | `string` | n/a | yes |
| <a name="input_cluster_addons"></a> [cluster\_addons](#input\_cluster\_addons) | Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name` | `any` | n/a | yes |
| <a name="input_cluster_admin_role_arn"></a> [cluster\_admin\_role\_arn](#input\_cluster\_admin\_role\_arn) | ARN of the IAM role to be granted cluster admin access | `string` | n/a | yes |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled | `bool` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The EKS cluster version. | `string` | n/a | yes |
| <a name="input_create_cloudwatch_log_group"></a> [create\_cloudwatch\_log\_group](#input\_create\_cloudwatch\_log\_group) | Determines whether a log group is created by this module for the cluster logs. If not, AWS will automatically create one if logging is enabled | `bool` | `true` | no |
| <a name="input_devops_nodes_az"></a> [devops\_nodes\_az](#input\_devops\_nodes\_az) | Availability zone for the devops nodes. | `string` | `"eu-west-1b"` | no |
| <a name="input_devops_nodes_desired_size"></a> [devops\_nodes\_desired\_size](#input\_devops\_nodes\_desired\_size) | The desired capacity of the autoscaling group | `number` | n/a | yes |
| <a name="input_devops_nodes_enable_monitoring"></a> [devops\_nodes\_enable\_monitoring](#input\_devops\_nodes\_enable\_monitoring) | Enables/disables detailed monitoring | `bool` | n/a | yes |
| <a name="input_devops_nodes_instance_type"></a> [devops\_nodes\_instance\_type](#input\_devops\_nodes\_instance\_type) | The instance type to use for the node group | `string` | n/a | yes |
| <a name="input_devops_nodes_max_size"></a> [devops\_nodes\_max\_size](#input\_devops\_nodes\_max\_size) | The maximum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_devops_nodes_min_size"></a> [devops\_nodes\_min\_size](#input\_devops\_nodes\_min\_size) | The minimum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_enabled_log_types"></a> [enabled\_log\_types](#input\_enabled\_log\_types) | A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | `list(string)` | n/a | yes |
| <a name="input_node_iam_role_additional_policies"></a> [node\_iam\_role\_additional\_policies](#input\_node\_iam\_role\_additional\_policies) | Additional policies to be added to the EKS Nodes IAM role | `map(string)` | `{}` | no |
| <a name="input_node_root_volume_size"></a> [node\_root\_volume\_size](#input\_node\_root\_volume\_size) | The size of the root volume in gb | `string` | `"10"` | no |
| <a name="input_node_security_group_additional_rules"></a> [node\_security\_group\_additional\_rules](#input\_node\_security\_group\_additional\_rules) | List of additional security group rules to add to the node security group created. Set `source_cluster_security_group = true` inside rules to set the `cluster_security_group` as source | `any` | `{}` | no |
| <a name="input_nodes_subnet_type"></a> [nodes\_subnet\_type](#input\_nodes\_subnet\_type) | Which subnets to place the nodes in: "private" or "public". | `string` | `"private"` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | The platform which the VPC will be created for. | `string` | n/a | yes |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | List of private subnet IDs where EKS control plane will be created in | `list(string)` | n/a | yes |
| <a name="input_saha_nodes_az"></a> [saha\_nodes\_az](#input\_saha\_nodes\_az) | Availability zone for the saha nodes. | `string` | `"eu-west-1a"` | no |
| <a name="input_saha_nodes_desired_size"></a> [saha\_nodes\_desired\_size](#input\_saha\_nodes\_desired\_size) | The desired capacity of the autoscaling group | `number` | n/a | yes |
| <a name="input_saha_nodes_enable_monitoring"></a> [saha\_nodes\_enable\_monitoring](#input\_saha\_nodes\_enable\_monitoring) | Enables/disables detailed monitoring | `bool` | n/a | yes |
| <a name="input_saha_nodes_instance_type"></a> [saha\_nodes\_instance\_type](#input\_saha\_nodes\_instance\_type) | The instance type to use for the node group | `string` | n/a | yes |
| <a name="input_saha_nodes_max_size"></a> [saha\_nodes\_max\_size](#input\_saha\_nodes\_max\_size) | The maximum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_saha_nodes_min_size"></a> [saha\_nodes\_min\_size](#input\_saha\_nodes\_min\_size) | The minimum size of the autoscaling group | `number` | n/a | yes |
| <a name="input_security_group_additional_rules"></a> [security\_group\_additional\_rules](#input\_security\_group\_additional\_rules) | List of additional security group rules to add to the cluster security group created. Set `source_node_security_group = true` inside rules to set the `node_security_group` as source | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_user_data_template_path"></a> [user\_data\_template\_path](#input\_user\_data\_template\_path) | Path to a local, custom user data template file to use when rendering user data | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC where resources will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_access_entries"></a> [access\_entries](#output\_access\_entries) | Map of access entries created and their attributes |
| <a name="output_cluster_addons"></a> [cluster\_addons](#output\_cluster\_addons) | Map of attribute maps for all EKS cluster addons enabled |
| <a name="output_cluster_certificate_authority_data"></a> [cluster\_certificate\_authority\_data](#output\_cluster\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with the cluster |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for your Kubernetes API server |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the EKS cluster |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | ID of the cluster security group |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The Kubernetes version for the cluster |
| <a name="output_node_security_group_id"></a> [node\_security\_group\_id](#output\_node\_security\_group\_id) | ID of the node shared security group |
<!-- END_TF_DOCS -->
