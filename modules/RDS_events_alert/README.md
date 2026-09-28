# RDS Events Alert

This module creates an event subscription for a given RDS instance and sends out the alerts to a SNS topic (email address)


## Use case example
```
module "saha_lightsail" {
  source = "git::git@github.com:Alizandieh/tf-modules.git//modules/RDS_events_alert?ref=9bf21dc" --> this is the commit hash
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_db_event_subscription.rds_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_event_subscription) | resource |
| [aws_sns_topic.rds_alerts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.email_alert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_alert_email"></a> [alert\_email](#input\_alert\_email) | Email address to receive RDS alerts | `string` | n/a | yes |
| <a name="input_db_event_subscription_name"></a> [db\_event\_subscription\_name](#input\_db\_event\_subscription\_name) | Name for the DB event subscription | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the event subscription is enabled | `bool` | `true` | no |
| <a name="input_event_categories"></a> [event\_categories](#input\_event\_categories) | Event categories to monitor (e.g., failure, configuration-change) | `list(string)` | n/a | yes |
| <a name="input_rds_source_identifiers"></a> [rds\_source\_identifiers](#input\_rds\_source\_identifiers) | List of RDS instance identifiers or ARNs to monitor. Empty = all instances. | `list(string)` | `[]` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Name for the SNS topic | `string` | n/a | yes |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | Source type for events: db-instance, db-parameter-group, db-security-group, or db-snapshot | `string` | `"db-instance"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_event_subscription_id"></a> [event\_subscription\_id](#output\_event\_subscription\_id) | ID of the created DB event subscription |
| <a name="output_sns_topic_arn"></a> [sns\_topic\_arn](#output\_sns\_topic\_arn) | ARN of the created SNS topic |
<!-- END_TF_DOCS -->
