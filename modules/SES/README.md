# SES

This module create a SES with domain, DKIM, SPR and DMARC verifications.
It also creates the SMTP IAM user and credentials and saves the creds in AWS Secret manager

## Use case example
```
module "saha_ses" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/SES?ref=9bf21dc" --> this is the commit hash
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.0.0 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.8.2 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_iam_access_key.smtp_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.smtp_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.ses_send_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_route53_record.mail_from_mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mail_from_spf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ses_dmarc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ses_spf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.this_verify_dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_secretsmanager_secret.smtp_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.smtp_credentials](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_ses_domain_dkim.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_domain_mail_from.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_mail_from) | resource |
| [aws_ses_email_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_email_identity) | resource |
| [cloudflare_dns_record.mail_from_mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.mail_from_spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.ses_dmarc](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.ses_spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.this_verify_dkim](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudflare_domain"></a> [cloudflare\_domain](#input\_cloudflare\_domain) | Set to true if the domain is parked in Cloudflare | `bool` | `false` | no |
| <a name="input_create_smtp_user"></a> [create\_smtp\_user](#input\_create\_smtp\_user) | Whether to create an IAM user for SMTP access | `bool` | `false` | no |
| <a name="input_dmarc_enabled"></a> [dmarc\_enabled](#input\_dmarc\_enabled) | Set DMARC record in Route53. | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name from which AWS SES will be able to send emails. | `string` | n/a | yes |
| <a name="input_email_addresses"></a> [email\_addresses](#input\_email\_addresses) | Emails from which AWS SES will be able to send emails. | `set(string)` | `[]` | no |
| <a name="input_mail_from_domain"></a> [mail\_from\_domain](#input\_mail\_from\_domain) | custom MAIL FROM domain, it must be unique per AWS account/region | `string` | `""` | no |
| <a name="input_route53_domain"></a> [route53\_domain](#input\_route53\_domain) | Set to true if the domain is parked in Route53 | `bool` | `false` | no |
| <a name="input_smtp_secret_name"></a> [smtp\_secret\_name](#input\_smtp\_secret\_name) | Name for the Secrets Manager secret (defaults to 'ses/smtp/<domain>') | `string` | `""` | no |
| <a name="input_smtp_username"></a> [smtp\_username](#input\_smtp\_username) | Name for the SMTP IAM user. If empty, a default name will be generated | `string` | `""` | no |
| <a name="input_spf_enabled"></a> [spf\_enabled](#input\_spf\_enabled) | Set SPF record in Route53. | `bool` | `false` | no |
| <a name="input_verify_dkim"></a> [verify\_dkim](#input\_verify\_dkim) | Automatically verify DKIM records in Route53. | `bool` | `false` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Route53/Cloudflare zone ID for the domain name. | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
