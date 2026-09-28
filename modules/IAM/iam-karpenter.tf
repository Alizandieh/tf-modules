resource "aws_iam_role" "karpenter" {
  count = var.karpenter_role ? 1 : 0

  name = "eks-karpenter-role"
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

resource "aws_iam_policy" "karpenter_controller" {
  count       = var.karpenter_role ? 1 : 0
  name        = "KarpenterControllerPolicy"
  description = "Permissions for Karpenter to manage EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateLaunchTemplate",
          "ec2:CreateFleet",
          "ec2:RunInstances",
          "ec2:CreateTags",
          "ec2:TerminateInstances",
          "ec2:Describe*",
          "ec2:DeleteLaunchTemplate",
          "ssm:GetParameter",
          "pricing:GetProducts",
          "iam:PassRole",
          "iam:GetInstanceProfile",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:DeleteInstanceProfile",
          "iam:CreateInstanceProfile",
          "iam:TagInstanceProfile",
          "iam:AddRoleToInstanceProfile",
          "iam:ListInstanceProfiles",
          "eks:DescribeCluster"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "karpenter_controller_ec2" {
  count = var.karpenter_role ? 1 : 0

  role       = aws_iam_role.karpenter[0].name
  policy_arn = aws_iam_policy.karpenter_controller[0].arn
}

resource "aws_iam_role_policy_attachment" "karpenter_controller_ssm" {
  count = var.karpenter_role ? 1 : 0

  role       = aws_iam_role.karpenter[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_eks_pod_identity_association" "karpenter" {
  count = var.karpenter_role ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "karpenter"
  service_account = "karpenter"
  role_arn        = aws_iam_role.karpenter[0].arn
}
