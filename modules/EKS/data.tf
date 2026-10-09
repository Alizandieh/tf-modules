data "aws_availability_zones" "region_azs" {}
data "aws_region" "current" {}

data "aws_subnet" "private" {
  for_each = toset(var.subnet_ids)
  id       = each.value
}

data "aws_subnet" "public" {
  for_each = toset(var.subnet_ids)
  id       = each.value
}
