variable "env" {}

variable "aws_account_id" {
  description = "AWS account ID"
}

variable "enabled" {
  default = true
}

variable "dd_api_key" {
  description = "Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_app_key" {
  description = "Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "monitor_type" {
  description = "The type of the monitor. For more info visit https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor"
  default     = "metric alert"
}

# Threshold values
variable "sqs_normal_threshold" {
  description = "The length of the message queue which is considered normal. For more information visit: https://docs.datadoghq.com/integrations/amazon_sqs/"
  default     = 0
}

variable "sqs_warning_threshold" {
  description = "The length of the message queue which is considered warning. For more information visit: https://docs.datadoghq.com/integrations/amazon_sqs/ "
  default     = 2
}

variable "sqs_critical_threshold" {
  description = "In minutes. Message queue length that causes critical alert. For more information visit: https://docs.datadoghq.com/integrations/amazon_sqs/"
  default     = 10
}

# SQS queue settings
variable "sqs_threshold_duration" {
  description = "Duration of SQS threshold. Interval during which the measurement is carried out"
  default     = "last_5m"
}

variable "sqs_queue_metric" {
  description = "To create queue see https://www.datadoghq.com/blog/monitor-amazon-sqs-message-traffic-datadog/"
  default     = "avg:aws.sqs.approximate_number_of_messages_visible"
}

variable "queue_name" {
  description = "The name of the message queue being monitored."
}

###

variable "renotify_interval" {
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. For more info please visit: https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor"
  default     = 5
}

variable "notification_targets" {
  description = "List of targets to notify. For example it could be @slack-alerts or @user@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list
}
