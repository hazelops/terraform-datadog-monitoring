variable "dd_api_key" {}

variable "dd_app_key" {}

variable "env" {}

variable "recipient" {
  default = []
}

variable "name" {}

variable "tags" {
  default = []
}

variable "type" {
  default = "browser"
}

variable "subtype" {
  default = "http"
}

//variable "api_request_headers" {
//  default =  {
//Content-Type = "application/json"
//Authentication = "Token: 1234566789"
//}
//}

//variable "request_type" {
//  default = "GET"
//}

variable "url" {
}

variable "device_ids" {
  default = ["laptop_large"]
}

variable "locations" {
  default = ["aws:us-west-1"]

}

variable "webtest_options" {
  default = {
    tick_every = 300
  }
}

variable "dd_message_up" {
  default = "The problems is gone on:"
}

variable "dd_message_down" {
  default = "There are some problems on:"
}

variable "api_options" {
  default = {
    tick_every = 60
  }
}

variable "api_assertions" {
  default = [
    {
      type = "statusCode"
      operator = "is"
      target = "200"
    }
  ]
}

variable "ssl_port" {
  default = "443"
}

variable "ssl_options" {
  default = {
    tick_every = 900
    accept_self_signed = true
  }
}

variable "ssl_assertions" {
  default = [
    {
      type = "certificate"
      operator = "isInMoreThan"
      target = 30
    }
  ]
}
