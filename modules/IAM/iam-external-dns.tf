resource "aws_iam_role" "external_dns" {
  count = var.external_dns_role ? 1 : 0

  name = "eks-external-dns-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "pods.eks.amazonaws.com"
        },
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "external_dns_route53" {
  count = var.external_dns_role ? 1 : 0

  name        = "external-dns-route53-access"
  description = "Allow External DNS to manage Route 53 records"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets"
        ],
        Resource = "arn:aws:route53:::hostedzone/*"
      },
      {
        Effect = "Allow",
        Action = [
          "route53:ListHostedZones"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "route53" {
  count = var.external_dns_role ? 1 : 0

  role       = aws_iam_role.external_dns[0].name
  policy_arn = aws_iam_policy.external_dns_route53[0].arn
}

resource "aws_eks_pod_identity_association" "external_dns" {
  count = var.external_dns_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "external-dns"
  service_account = "external-dns"
  role_arn        = aws_iam_role.external_dns[0].arn
}
