resource "cloudflare_dns_record" "this_verify_dkim" {
  count = var.cloudflare_domain == true && var.zone_id != "" && var.verify_dkim ? 3 : 0

  zone_id = var.zone_id
  name    = local.dkim_verification_attrs[count.index].name
  type    = local.dkim_verification_attrs[count.index].type
  ttl     = local.dkim_verification_attrs[count.index].ttl
  content = local.dkim_verification_attrs[count.index].value
  proxied = false
  comment = "DKIM verification record"
}

resource "cloudflare_dns_record" "ses_dmarc" {
  count = var.cloudflare_domain == true && var.zone_id != "" && var.dmarc_enabled ? 1 : 0

  zone_id = var.zone_id
  name    = "_dmarc.${var.domain_name}"
  type    = "TXT"
  ttl     = 600
  content = "\"v=DMARC1;p=quarantine;rua=mailto:dmarc_report@${var.domain_name}\""
  proxied = false
  comment = "DMARC policy record"
}

resource "cloudflare_dns_record" "ses_spf" {
  count = var.cloudflare_domain == true && var.zone_id != "" && var.spf_enabled ? 1 : 0

  zone_id = var.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 600
  content = "\"v=spf1 include:amazonses.com include:spf.protection.outlook.com ~all\""
  proxied = false
  comment = "SPF record for Amazon SES and Microsoft Outlook"
}

resource "cloudflare_dns_record" "mail_from_mx" {
  count = var.cloudflare_domain == true && var.zone_id != "" ? 1 : 0

  zone_id  = var.zone_id
  name     = local.mail_from_domain
  type     = "MX"
  ttl      = 300
  priority = 10
  content  = "feedback-smtp.${data.aws_region.current.region}.amazonses.com"
  proxied  = false
  comment  = "Mail FROM domain MX record"
}

resource "cloudflare_dns_record" "mail_from_spf" {
  count = var.cloudflare_domain == true && var.zone_id != "" ? 1 : 0

  zone_id = var.zone_id
  name    = local.mail_from_domain
  type    = "TXT"
  ttl     = 300
  content = "\"v=spf1 include:amazonses.com ~all\""
  proxied = false
  comment = "SPF record for Mail FROM domain"
}
