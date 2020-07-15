# Configure the Datadog provider
provider "datadog" {
  api_key = var.dd_api_key
  app_key = var.dd_app_key
}

# Create Datadog synthetics browser site availability test
resource "datadog_synthetics_test" "test_browser" {
  count = (var.type == "browser") ? 1 : 0
  name = var.name
  type = var.type
  request =  {
    method = "GET"
    url=var.url
  }
  device_ids = var.device_ids
  locations  = var.locations
  options = var.webtest_options
  message = "${var.recipient} {{#is_alert}} ${var.dd_message_down} ${var.url}  {{/is_alert}} {{^is_alert}} ${var.dd_message_up} ${var.url}  {{/is_alert}}"
  tags = concat(["env:${var.env}", "service:${var.name}"], var.tags)
  status = "live"
}

# Create Datadog api/http test
resource "datadog_synthetics_test" "test_api" {
  count = (var.type == "api" && var.subtype == "http") ? 1 : 0
  type = var.type
  subtype = var.subtype
  request = {
    method = "GET"
    url = var.url
  }

//  request_headers = var.api_request_headers

  assertions = var.api_assertions
  locations = var.locations
  options = var.api_options
  name = "An API test on ${var.url}"
  message = "${var.recipient} {{#is_alert}} ${var.dd_message_down} ${var.url}  {{/is_alert}} {{^is_alert}} ${var.dd_message_up} ${var.url}  {{/is_alert}}"
  tags = concat(["env:${var.env}", "service:${var.name}"], var.tags)
  status = "live"
}

# API\SSL test
resource "datadog_synthetics_test" "test_ssl" {
  count = (var.type == "api" && var.subtype == "ssl") ? 1 : 0
  type = var.type
  subtype = var.subtype
  request = {
    host = var.url
    port = var.ssl_port
  }
  assertions = var.ssl_assertions
  locations = var.locations
  options = var.ssl_options
  name = "An API/SSL test on ${var.url}"

  message = "${var.recipient} {{#is_alert}} ${var.dd_message_down} ${var.url}  {{/is_alert}} {{^is_alert}} ${var.dd_message_up} ${var.url}  {{/is_alert}}"

  tags = concat(["env:${var.env}", "service:${var.name}"], var.tags)

  status = "live"
}














//single_nat_gateway = var.env == "prod" ? false : true


//  message = join(" ", ["@${var.recipient}", "{{#is_alert}} Website", var.url, "is not available! {{/is_alert}}", "{{^is_alert}} Website", var.url, "is back to live! {{/is_alert}}"])



