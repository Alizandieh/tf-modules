locals {
  azs = slice(data.aws_availability_zones.region_azs.names, 0, var.az_count)
}
