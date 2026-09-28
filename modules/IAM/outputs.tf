output "cert_manager_role_arn" {
  description = "The ARN of the cert-manager IAM role"
  value       = try(aws_iam_role.cert_manager[0].arn, null)
}

output "external_dns_role_arn" {
  description = "The ARN of the External DNS IAM role"
  value       = try(aws_iam_role.external_dns[0].arn, null)
}

output "external_secrets_role_arn" {
  description = "The ARN of the External Secrets IAM role"
  value       = try(aws_iam_role.external_secrets[0].arn, null)
}

output "bridge_s3_role_arn" {
  description = "The ARN of the Bridge application IAM role"
  value       = try(aws_iam_role.bridge_s3[0].arn, null)
}

output "loki_s3_role_arn" {
  description = "The ARN of the Loki IAM role"
  value       = try(aws_iam_role.loki_s3[0].arn, null)
}

output "grafana_role_arn" {
  description = "The ARN of the Grafana IAM role"
  value       = try(aws_iam_role.grafana[0].arn, null)
}
