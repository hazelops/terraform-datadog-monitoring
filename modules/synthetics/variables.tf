variable "env" {}

variable "dd_api_key" {
  description = "Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_app_key" {
  description = "Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "target_names" {
  description = "List of targets to inform. For example it could be @slack-alerts or @user:name@somemail.com. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list
}

variable "enabled" {
  default = true
}

variable "synthetics_name" {}

variable "synthetics_tags" {
  default = []
}

variable "synthetics_type" {
  default = "browser"
}

variable "synthetics_subtype" {
  default = "http"
}

variable "synthetics_url" {
}

variable "synthetics_device_ids" {
  default = ["laptop_large"]
}

variable "synthetics_locations" {
  default = ["aws:us-west-1"]

}

variable "synthetics_webtest_options" {
  default = {
    tick_every = 300
  }
}

variable "synthetics_alert_down_message" {
  default = "There are some problems on:"
}

variable "synthetics_alert_up_message" {
  default = "The problems are gone on:"
}

variable "synthetics_api_options" {
  default = {
    tick_every = 60
  }
}

variable "synthetics_api_assertions" {
  default = [
    {
      type     = "statusCode"
      operator = "is"
      target   = "200"
    }
  ]
}

variable "synthetics_ssl_port" {
  default = "443"
}

variable "synthetics_ssl_options" {
  default = {
    tick_every         = 900
    accept_self_signed = true
  }
}

variable "synthetics_ssl_assertions" {
  default = [
    {
      type     = "certificate"
      operator = "isInMoreThan"
      target   = 30
    }
  ]
}

variable "synthetics_status" {
  default = "live"
}
