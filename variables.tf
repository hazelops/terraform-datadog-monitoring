variable "dd_api_key" {}

variable "dd_app_key" {}

variable "env" {}

variable "email" {}

variable "app_name" {
  default = "squibby"
}

variable "synthetics_tags" {
  default = []
}

variable "synthetics_type" {
  default = "browser"
}

variable "synthetics_subtype" {
  default = "web"
}

variable "synthetics_request_url" {
}

variable "device_type" {
  default = ["laptop_large"]
}

variable "locations_type" {
  default = ["aws:us-west-1"]

}

variable "dd_options" {
  default = {
    tick_every = 300
  }
}

//variable "dd_message" {
//  default = "{{#is_alert}} Website is not available! {{/is_alert}} {{^is_alert}} Website is back to live! {{/is_alert}}"
//}
