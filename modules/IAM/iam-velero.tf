resource "aws_iam_role" "velero" {
  count = var.velero_role ? 1 : 0

  name = "velero-role"
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

resource "aws_iam_policy" "velero_access" {
  count = var.velero_role ? 1 : 0

  name        = "velero-access"
  description = "Allow velero to access EC2 and S3"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DescribeVolumes",
          "ec2:DescribeSnapshots",
          "ec2:CreateTags",
          "ec2:CreateVolume",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:PutObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        "Resource" : [
          "arn:aws:s3:::${var.velero_bucket_name}",
          "arn:aws:s3:::${var.velero_bucket_name}/*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::${var.velero_bucket_name}"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "velero_iam_attach" {
  count = var.velero_role ? 1 : 0

  role       = aws_iam_role.velero[0].name
  policy_arn = aws_iam_policy.velero_access[0].arn
}

resource "aws_eks_pod_identity_association" "velero" {
  count = var.velero_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "velero"
  service_account = "velero"
  role_arn        = aws_iam_role.velero[0].arn
}
