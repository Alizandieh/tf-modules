variable "domain_name" {
  type        = string
  description = "The domain name from which AWS SES will be able to send emails."
}

variable "mail_from_domain" {
  type        = string
  description = "custom MAIL FROM domain, it must be unique per AWS account/region"
  default     = ""
}

variable "route53_domain" {
  type        = bool
  description = "Set to true if the domain is parked in Route53"
  default     = false
}

variable "cloudflare_domain" {
  type        = bool
  description = "Set to true if the domain is parked in Cloudflare"
  default     = false
}

# optional
variable "email_addresses" {
  type        = set(string)
  default     = []
  description = "Emails from which AWS SES will be able to send emails."
}

variable "zone_id" {
  type        = string
  description = "The Route53/Cloudflare zone ID for the domain name."
  default     = ""
}

variable "verify_dkim" {
  type        = bool
  description = "Automatically verify DKIM records in Route53."
  default     = false
}

variable "dmarc_enabled" {
  type        = bool
  description = "Set DMARC record in Route53."
  default     = false
}

variable "spf_enabled" {
  type        = bool
  description = "Set SPF record in Route53."
  default     = false
}

variable "create_smtp_user" {
  description = "Whether to create an IAM user for SMTP access"
  type        = bool
  default     = false
}

variable "smtp_username" {
  description = "Name for the SMTP IAM user. If empty, a default name will be generated"
  type        = string
  default     = ""
}

variable "smtp_secret_name" {
  description = "Name for the Secrets Manager secret (defaults to 'ses/smtp/<domain>')"
  type        = string
  default     = ""
}
