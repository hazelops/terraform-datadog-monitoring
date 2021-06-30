variable "env" {}

variable "enabled" {
  default = true
}

variable "dd_api_key" {
  description = "Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_app_key" {
  description = "Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "name" {}

variable "service_name" {}

variable "target_names" {
  description = "List of targets to inform. For example it could be @slack-alerts or @user:name@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list
}

variable "synthetics_url" {}

variable "synthetics_type" {
  default = "browser"
}

variable "synthetics_subtype" {
  default = "http"
}

variable "synthetics_device_ids" {
  default = ["laptop_large"]
}

variable "synthetics_locations" {
  default = ["aws:us-west-1"]
}

variable "browser_request_frequency" {
  default = 300
}

variable "synthetics_alert_down_message" {
  default = "There are some problems on:"
}

variable "synthetics_alert_up_message" {
  default = "The problems are gone on:"
}

variable "api_request_frequency" {
  default = 60
}

variable "api_assertion_type" {
  type = string
  default = "statusCode"
}
variable "api_assertion_operator" {
  type = string
  default = "is"
}
variable "api_assertion_target" {
  type = string
  default = "200"
}

variable "synthetics_ssl_port" {
  default = "443"
}

variable "synthetics_ssl_request_frequency" {
  default = 900
}

variable "synthetics_ssl_accept_self_signed" {
  default = true
}

variable "ssl_assertion_type" {
  default = "certificate"
}
variable "ssl_assertion_operator" {
  default = "isInMoreThan"
}
variable "ssl_assertion_target" {
  default = 30
}

variable "synthetics_status" {
  default = "live"
}
