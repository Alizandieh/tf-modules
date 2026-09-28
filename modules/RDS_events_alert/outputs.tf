output "sns_topic_arn" {
  description = "ARN of the created SNS topic"
  value       = aws_sns_topic.rds_alerts.arn
}

output "event_subscription_id" {
  description = "ID of the created DB event subscription"
  value       = aws_db_event_subscription.rds_events.id
}
