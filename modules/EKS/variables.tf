variable "platform" {
  description = "The platform which the VPC will be created for."
  type        = string
}

variable "cluster_version" {
  description = "The EKS cluster version."
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where resources will be deployed"
  type        = list(string)
}

variable "cluster_addons" {
  description = "Map of cluster addon configurations to enable for the cluster. Addon name can be the map keys or set with `name`"
  type        = any
}
variable "ami_type" {
  description = "The AMI type to use for the node group"
  type        = string
}

variable "ami_id" {
  description = "The AMI from which to launch the instance"
  type        = string
  default     = ""
}

variable "create_cloudwatch_log_group" {
  description = "Determines whether a log group is created by this module for the cluster logs. If not, AWS will automatically create one if logging is enabled"
  type        = bool
  default     = true
}

variable "enabled_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
}

variable "bridge_nodes_instance_type" {
  description = "The instance type to use for the node group"
  type        = string
}

variable "bridge_nodes_min_size" {
  description = "The minimum size of the autoscaling group"
  type        = number
}

variable "bridge_nodes_max_size" {
  description = "The maximum size of the autoscaling group"
  type        = number
}

variable "bridge_nodes_desired_size" {
  description = "The desired capacity of the autoscaling group"
  type        = number
}

variable "bridge_nodes_enable_monitoring" {
  description = "Enables/disables detailed monitoring"
  type        = bool
}

variable "devops_nodes_instance_type" {
  description = "The instance type to use for the node group"
  type        = string
}

variable "devops_nodes_min_size" {
  description = "The minimum size of the autoscaling group"
  type        = number
}

variable "devops_nodes_max_size" {
  description = "The maximum size of the autoscaling group"
  type        = number
}

variable "devops_nodes_desired_size" {
  description = "The desired capacity of the autoscaling group"
  type        = number
}

variable "devops_nodes_enable_monitoring" {
  description = "Enables/disables detailed monitoring"
  type        = bool
}

variable "cluster_admin_role_arn" {
  description = "ARN of the IAM role to be granted cluster admin access"
  type        = string
}

variable "user_data_template_path" {
  description = "Path to a local, custom user data template file to use when rendering user data"
  type        = string
  default     = ""
}

variable "security_group_additional_rules" {
  description = "List of additional security group rules to add to the cluster security group created. Set `source_node_security_group = true` inside rules to set the `node_security_group` as source"
  type        = any
  default     = {}
}

variable "node_security_group_additional_rules" {
  description = "List of additional security group rules to add to the node security group created. Set `source_cluster_security_group = true` inside rules to set the `cluster_security_group` as source"
  type        = any
  default     = {}
}

variable "node_iam_role_additional_policies" {
  description = "Additional policies to be added to the EKS Nodes IAM role"
  type        = map(string)
  default     = {}
}

variable "node_root_volume_size" {
  description = "The size of the root volume in gb"
  type        = string
  default     = "10"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
