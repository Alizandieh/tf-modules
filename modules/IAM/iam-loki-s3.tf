resource "aws_iam_role" "loki_s3" {
  count = var.loki_s3_role ? 1 : 0

  name = "loki-s3-role"
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

resource "aws_iam_policy" "loki_s3_access" {
  count = var.loki_s3_role ? 1 : 0

  name        = "loki-s3-access"
  description = "Allow Loki to access S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "LokiStorage"
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${var.loki_chunks_bucket_name}",
          "arn:aws:s3:::${var.loki_chunks_bucket_name}/*",
          "arn:aws:s3:::${var.loki_ruler_bucket_name}",
          "arn:aws:s3:::${var.loki_ruler_bucket_name}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "loki_s3_iam_attach" {
  count = var.loki_s3_role ? 1 : 0

  role       = aws_iam_role.loki_s3[0].name
  policy_arn = aws_iam_policy.loki_s3_access[0].arn
}

resource "aws_eks_pod_identity_association" "loki_s3" {
  count = var.loki_s3_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "monitoring"
  service_account = "loki"
  role_arn        = aws_iam_role.loki_s3[0].arn
}
