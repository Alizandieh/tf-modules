variable "db_event_subscription_name" {
  description = "Name for the DB event subscription"
  type        = string
}

variable "sns_topic_name" {
  description = "Name for the SNS topic"
  type        = string
}

variable "alert_email" {
  description = "Email address to receive RDS alerts"
  type        = string
}

variable "rds_source_identifiers" {
  description = "List of RDS instance identifiers or ARNs to monitor. Empty = all instances."
  type        = list(string)
  default     = []
}

variable "event_categories" {
  description = "Event categories to monitor (e.g., failure, configuration-change)"
  type        = list(string)
}

variable "enabled" {
  description = "Whether the event subscription is enabled"
  type        = bool
  default     = true
}

variable "source_type" {
  description = "Source type for events: db-instance, db-parameter-group, db-security-group, or db-snapshot"
  type        = string
  default     = "db-instance"
}
