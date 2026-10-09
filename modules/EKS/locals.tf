locals {
  selected_subnets = var.nodes_subnet_type == "public" ? data.aws_subnet.public : data.aws_subnet.private

  saha_nodes_subnet_ids = [
    for s in local.selected_subnets :
    s.id if s.availability_zone == var.saha_nodes_az
  ]

  devops_nodes_subnet_ids = [
    for s in local.selected_subnets :
    s.id if s.availability_zone == var.devops_nodes_az
  ]
}
