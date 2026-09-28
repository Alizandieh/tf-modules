output "availability_zones" {
  description = "The list of availability zones the VPC sits within."
  value       = [local.azs]
}

output "subnets" {
  description = "A map of subnets (public, private)."
  value = {
    "public"  = module.vpc.public_subnets,
    "private" = module.vpc.private_subnets
  }
}

output "subnet_cidrs" {
  description = "A map of subnets CIDR blocks (public, private)."
  value = {
    "public"  = module.vpc.public_subnets_cidr_blocks,
    "private" = module.vpc.private_subnets_cidr_blocks
  }
}

output "routetables_ids" {
  description = "A map of routetables ids (public, private)."
  value = {
    "public"  = module.vpc.public_route_table_ids,
    "private" = module.vpc.private_route_table_ids
  }
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "The name of the VPC."
  value       = module.vpc.name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks of the VPC"
  value       = module.vpc.vpc_secondary_cidr_blocks
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table_ids
}
