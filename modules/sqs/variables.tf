variable "env" {}

variable "aws_profile" {}

variable "enabled" {
  default = true
}
variable "sqs_enabled" {
  default = true
}

variable "dd_api_key" {
  description = "Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_app_key" {
  description = "Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "namespace" {}

variable "service_name" {}

# Threshold values

variable "sqs_normal_value" {
  description = ""
  default = 0
}

variable "sqs_warning_value" {
  description = ""
  default = 2
}

variable "sqs_critical_value" {
  description = ""
  default = 10
}

# SQS queue settings
variable "sqs_threshold_duration" {
  description = ""
  default = "last_10m"
}

variable "sqs_queue_metric" {
  description = "see https://www.datadoghq.com/blog/monitor-amazon-sqs-message-traffic-datadog/"
  default = "approximate_number_of_messages_visible"
}

variable "queuename" {
  description = "Name of the SQS queue"
  default = "<queuename>"
}
###
variable "renotify_interval" {
  description = "In minutes"
  default = 5
}

variable "target_names" {
  description = "List of targets to inform. For example it could be @slack-alerts or @user:name@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list
}
