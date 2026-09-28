# ============================================
# SNS Topic for RDS Alerts
# ============================================
resource "aws_sns_topic" "rds_alerts" {
  name = var.sns_topic_name
}

# ============================================
# SNS Email Subscription
# ============================================
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.rds_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# ============================================
# RDS Event Subscription
# ============================================
resource "aws_db_event_subscription" "rds_events" {
  name      = var.db_event_subscription_name
  sns_topic = aws_sns_topic.rds_alerts.arn

  # Optional: Monitor specific RDS instances (leave empty for all)
  source_ids  = var.rds_source_identifiers
  source_type = var.source_type

  event_categories = var.event_categories
  enabled          = var.enabled

  depends_on = [aws_sns_topic_subscription.email_alert]
}
