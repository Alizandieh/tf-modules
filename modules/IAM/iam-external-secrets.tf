resource "aws_iam_role" "external_secrets" {
  count = var.external_secrets_role ? 1 : 0

  name = "eks-external-secrets-role"
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

resource "aws_iam_role_policy_attachment" "secrets_manager_read" {
  count = var.external_secrets_role ? 1 : 0

  role       = aws_iam_role.external_secrets[0].name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_eks_pod_identity_association" "bitbucket_secrets" {
  count = var.external_secrets_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "external-secrets"
  service_account = "external-secrets"
  role_arn        = aws_iam_role.external_secrets[0].arn
}
