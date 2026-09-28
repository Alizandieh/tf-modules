data "aws_region" "current" {}

locals {
  mail_from_domain = var.mail_from_domain != "" ? var.mail_from_domain : "mail.${var.domain_name}"
  dkim_verification_attrs = [for dkim in aws_ses_domain_dkim.this.dkim_tokens : {
    name  = "${dkim}._domainkey.${var.domain_name}"
    ttl   = 600
    type  = "CNAME"
    value = "${dkim}.dkim.amazonses.com"
  }]
}

resource "aws_ses_email_identity" "this" {
  for_each = var.email_addresses
  email    = each.key
}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_domain_mail_from" "this" {
  domain                 = var.domain_name
  mail_from_domain       = local.mail_from_domain
  behavior_on_mx_failure = "UseDefaultValue"
}


# Creating SMTP credentials
resource "aws_iam_user" "smtp_user" {
  count = var.create_smtp_user ? 1 : 0
  name  = var.smtp_username != "" ? var.smtp_username : "ses-smtp-user-${var.domain_name}"
}

resource "aws_iam_access_key" "smtp_user" {
  count = var.create_smtp_user ? 1 : 0
  user  = aws_iam_user.smtp_user[0].name
}

resource "aws_iam_user_policy" "ses_send_email" {
  count = var.create_smtp_user ? 1 : 0
  name  = "SESSendEmail"
  user  = aws_iam_user.smtp_user[0].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_secretsmanager_secret" "smtp_credentials" {
  count       = var.create_smtp_user ? 1 : 0
  name        = var.smtp_secret_name != "" ? var.smtp_secret_name : "ses/smtp/${var.domain_name}"
  description = "SMTP credentials for ${var.domain_name} SES"
}

resource "aws_secretsmanager_secret_version" "smtp_credentials" {
  count     = var.create_smtp_user ? 1 : 0
  secret_id = aws_secretsmanager_secret.smtp_credentials[0].id
  secret_string = jsonencode({
    username    = aws_iam_access_key.smtp_user[0].id
    password    = aws_iam_access_key.smtp_user[0].ses_smtp_password_v4
    smtp_server = "email-smtp.${data.aws_region.current.region}.amazonaws.com"
    smtp_port   = 587
    region      = data.aws_region.current.region
  })
}
