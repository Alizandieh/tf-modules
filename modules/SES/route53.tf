resource "aws_route53_record" "this_verify_dkim" {
  count = var.route53_domain == true && var.zone_id != "" && var.verify_dkim ? 3 : 0

  zone_id = var.zone_id
  name    = local.dkim_verification_attrs[count.index].name
  type    = local.dkim_verification_attrs[count.index].type
  ttl     = local.dkim_verification_attrs[count.index].ttl
  records = [local.dkim_verification_attrs[count.index].value]
}

resource "aws_route53_record" "ses_dmarc" {
  count = var.route53_domain == true && var.zone_id != "" && var.dmarc_enabled ? 1 : 0

  zone_id = var.zone_id
  name    = "_dmarc.${var.domain_name}"
  type    = "TXT"
  ttl     = 600
  records = ["v=DMARC1;p=quarantine;rua=mailto:dmarc_report@${var.domain_name}"]
}

resource "aws_route53_record" "ses_spf" {
  count = var.route53_domain == true && var.zone_id != "" && var.spf_enabled ? 1 : 0

  zone_id = var.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 600
  records = ["v=spf1 include:amazonses.com ~all"]
}

resource "aws_route53_record" "mail_from_mx" {
  count = var.route53_domain == true && var.zone_id != "" ? 1 : 0

  zone_id = var.zone_id
  name    = local.mail_from_domain
  type    = "MX"
  ttl     = 300
  records = ["10 feedback-smtp.${data.aws_region.current.region}.amazonses.com"]
}

resource "aws_route53_record" "mail_from_spf" {
  count = var.route53_domain == true && var.zone_id != "" ? 1 : 0

  zone_id = var.zone_id
  name    = local.mail_from_domain
  type    = "TXT"
  ttl     = 300
  records = ["v=spf1 include:amazonses.com ~all"]
}
