# IAM

This module provides IAM roles required for different applications in the EKS cluster.

## Use case example
```
module "saha_iam" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/IAM?ref=9bf21dc" --> this is the commit hash
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.99.1 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_eks_pod_identity_association.bitbucket_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.bridge_s3_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.bridge_s3_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.grafana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.loki_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_eks_pod_identity_association.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_policy.bridge_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cert_manager_route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_dns_route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.grafana_cloudwatch_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.loki_s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.velero_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.bridge_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.grafana](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.karpenter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.loki_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.bridge_s3_iam_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cert_manager_iam_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.grafana_cloudwatch_iam_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.karpenter_controller_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.karpenter_controller_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.loki_s3_iam_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.secrets_manager_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.velero_iam_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_bridge_bucket_name"></a> [bridge\_bucket\_name](#input\_bridge\_bucket\_name) | The Bridge application s3 bucket | `string` | `""` | no |
| <a name="input_bridge_namespace"></a> [bridge\_namespace](#input\_bridge\_namespace) | The K8s namespace where the Bridge application is deployed | `string` | `""` | no |
| <a name="input_bridge_s3_role"></a> [bridge\_s3\_role](#input\_bridge\_s3\_role) | Whether to create IAM role for Bridge backend | `bool` | `false` | no |
| <a name="input_cert_manager_role"></a> [cert\_manager\_role](#input\_cert\_manager\_role) | Whether to create IAM resources for cert-manager | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS Cluster Name | `string` | n/a | yes |
| <a name="input_external_dns_role"></a> [external\_dns\_role](#input\_external\_dns\_role) | Whether to create IAM resources for External DNS | `bool` | `false` | no |
| <a name="input_external_secrets_role"></a> [external\_secrets\_role](#input\_external\_secrets\_role) | Whether to create IAM resources for External Secrets | `bool` | `false` | no |
| <a name="input_grafana_role"></a> [grafana\_role](#input\_grafana\_role) | Whether to create IAM role for Grafana CloudWatch data source | `bool` | `false` | no |
| <a name="input_karpenter_role"></a> [karpenter\_role](#input\_karpenter\_role) | Whether to create IAM resources for Karpenter | `bool` | `false` | no |
| <a name="input_loki_chunks_bucket_name"></a> [loki\_chunks\_bucket\_name](#input\_loki\_chunks\_bucket\_name) | The bucket created for Loki chunks | `string` | `""` | no |
| <a name="input_loki_ruler_bucket_name"></a> [loki\_ruler\_bucket\_name](#input\_loki\_ruler\_bucket\_name) | The bucket created for Loki ruler | `string` | `""` | no |
| <a name="input_loki_s3_role"></a> [loki\_s3\_role](#input\_loki\_s3\_role) | Whether to create IAM role for Loki | `bool` | `false` | no |
| <a name="input_velero_bucket_name"></a> [velero\_bucket\_name](#input\_velero\_bucket\_name) | The Velero bucket for backups | `string` | `""` | no |
| <a name="input_velero_role"></a> [velero\_role](#input\_velero\_role) | Whether to create IAM role for Velero | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_bridge_s3_role_arn"></a> [bridge\_s3\_role\_arn](#output\_bridge\_s3\_role\_arn) | The ARN of the Bridge application IAM role |
| <a name="output_cert_manager_role_arn"></a> [cert\_manager\_role\_arn](#output\_cert\_manager\_role\_arn) | The ARN of the cert-manager IAM role |
| <a name="output_external_dns_role_arn"></a> [external\_dns\_role\_arn](#output\_external\_dns\_role\_arn) | The ARN of the External DNS IAM role |
| <a name="output_external_secrets_role_arn"></a> [external\_secrets\_role\_arn](#output\_external\_secrets\_role\_arn) | The ARN of the External Secrets IAM role |
| <a name="output_grafana_role_arn"></a> [grafana\_role\_arn](#output\_grafana\_role\_arn) | The ARN of the Grafana IAM role |
| <a name="output_loki_s3_role_arn"></a> [loki\_s3\_role\_arn](#output\_loki\_s3\_role\_arn) | The ARN of the Loki IAM role |
<!-- END_TF_DOCS -->
