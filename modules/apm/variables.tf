variable "env" {}

variable "enabled" {
  default = true
}
variable "latency_enabled" {
  default = true
}

variable "errors_enabled" {
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

variable "monitor_type" {
  description = "The type of the monitor. For more info visit https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor"
  default     = "metric alert"
}

variable "latency_metric" {
  description = "Select metric to track. For more info, visit https://docs.datadoghq.com/metrics/"
  default     = "trace.flask.request"
  type        = string
}

variable "latency_threshold_duration" {
  description = "Timeframe during which the comparison is made."
  default     = "last_10m"
  type        = string
}

variable "latency_alert_threshold" {
  description = "The value used to trigger an alert notification. For more info visit https://docs.datadoghq.com/monitors/monitor_types/metric/?tab=threshold#thresholds "
  default     = "> 0.5"
  type        = string
}

variable "error_metric" {
  description = "Select metric to track. For more info visit https://docs.datadoghq.com/metrics/"
  default     = "trace.flask.request"
  type        = string
}

variable "error_threshold_duration" {
  description = "Timeframe during which the comparison is made."
  default     = "last_10m"
  type        = string
}

variable "error_alert_threshold" {
  description = "The value used to trigger an alert notification. For more info visit https://docs.datadoghq.com/monitors/monitor_types/metric/?tab=threshold#thresholds"
  default     = "> 0.05"
  type        = string
}

variable "target_names" {
  description = "List of targets to inform. For example it could be @slack-alerts or @user:name@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list
}
