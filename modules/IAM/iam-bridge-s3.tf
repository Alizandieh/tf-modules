resource "aws_iam_role" "bridge_s3" {
  count = var.bridge_s3_role ? 1 : 0

  name = "${var.bridge_namespace}-s3-role"
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

resource "aws_iam_policy" "bridge_s3_access" {
  count = var.bridge_s3_role ? 1 : 0

  name        = "${var.bridge_namespace}-s3-access"
  description = "Allow Bridge backend to access S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "BridgeStorage"
        Effect = "Allow"
        Action = [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = [
          "arn:aws:s3:::${var.bridge_bucket_name}",
          "arn:aws:s3:::${var.bridge_bucket_name}/*"
        ]
      },
      # Cross-account role assumption (CAI)
      {
        Sid    = "AssumeCrossAccountRole"
        Effect = "Allow"
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Resource = "arn:aws:iam::780457123707:role/cai-cross-account"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bridge_s3_iam_attach" {
  count = var.bridge_s3_role ? 1 : 0

  role       = aws_iam_role.bridge_s3[0].name
  policy_arn = aws_iam_policy.bridge_s3_access[0].arn
}

resource "aws_eks_pod_identity_association" "bridge_s3_gateway" {
  count = var.bridge_s3_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = var.bridge_namespace
  service_account = "bridge-gateway"
  role_arn        = aws_iam_role.bridge_s3[0].arn
}

resource "aws_eks_pod_identity_association" "bridge_s3_worker" {
  count = var.bridge_s3_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = var.bridge_namespace
  service_account = "bridge-worker"
  role_arn        = aws_iam_role.bridge_s3[0].arn
}
