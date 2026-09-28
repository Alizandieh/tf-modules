variable "platform" {
  description = "The platform which the VPC will be created for."
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "az_count" {
  description = "Number of Availability Zones to use"
  type        = number
  validation {
    condition     = var.az_count >= 1 && var.az_count <= 6
    error_message = "AZ count must be between 1 and 6 (inclusive)."
  }
}

variable "newbits" {
  description = "The number of additional bits to allocate for the subnet mask"
  type        = number
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Whether to create NAT Gateways for private subnets"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Whether to use a single shared NAT Gateway for all private subnets"
  type        = bool
}

variable "enable_flow_log" {
  description = "Whether to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "create_flow_log_cloudwatch_log_group" {
  description = "Whether to create a CloudWatch Log Group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create an IAM role for VPC Flow Logs to publish to CloudWatch"
  type        = bool
  default     = false
}

variable "enable_vpc_endpoints" {
  description = "Controls whether VPC endpoints should be created"
  type        = bool
  default     = false
}

variable "manage_default_vpc" {
  description = "Should be true to adopt and manage Default VPC"
  type        = bool
  default     = false
}

variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  type        = bool
  default     = false
}
