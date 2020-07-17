variable "api_key" {}

variable "app_key" {}

variable "env" {}

variable "synthetics_recipient" {}

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

variable "synthetics_alert_down" {
  default = "There are some problems on:"
}

variable "synthetics_alert_up" {
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
      type = "statusCode"
      operator = "is"
      target = "200"
    }
  ]
}

variable "synthetics_ssl_port" {
  default = "443"
}

variable "synthetics_ssl_options" {
  default = {
    tick_every = 900
    accept_self_signed = true
  }
}

variable "synthetics_ssl_assertions" {
  default = [
    {
      type = "certificate"
      operator = "isInMoreThan"
      target = 30
    }
  ]
}

variable "synthetics_status" {
  default = "live"
}

