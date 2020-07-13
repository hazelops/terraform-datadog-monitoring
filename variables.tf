variable "datadog_api_key" {}

variable "datadog_app_key" {}

variable "env" {
  default = "testnut"
}

variable "app_name" {
  default = "squibby"
}

variable "syntetics_tags" {
  default = []
}

variable "syntetics_type" {
  default = "browser"
}

variable "synthetics_subtype" {
  default = "web"
}

variable "synthetics_request" {
  default= {
    method = "GET"
    url = "https://squibby.testnut.nutcorp.net"
  }
}

variable "device_type" {
  default = ["laptop_large"]
}

variable "locations_type" {
  default = ["aws:us-west-1"]

}

variable "tick_interval" {
  default = 300
}