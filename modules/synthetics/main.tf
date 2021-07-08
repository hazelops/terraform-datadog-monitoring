# Create Datadog synthetics browser site availability test
resource "datadog_synthetics_test" "test_browser" {
  count = (var.enabled && var.synthetics_type == "browser") ? 1 : 0
  name  = var.name
  type  = "browser"
  request_definition {
    method = "GET"
    url    = var.synthetics_url
  }
  device_ids = var.synthetics_device_ids
  locations  = var.synthetics_locations
  options_list {
    tick_every = var.browser_request_frequency
  }
  message = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.notification_targets)}
EOM
  tags = [
    "env:${var.env}",
    "service:${var.service_name}",
    "terraform:true"
  ]
  status = var.synthetics_status
}

# Create Datadog synthetics api/http test
resource "datadog_synthetics_test" "test_api" {
  count   = (var.enabled && var.synthetics_type == "api" && var.synthetics_subtype == "http") ? 1 : 0
  name    = var.name
  type    = var.synthetics_type
  subtype = var.synthetics_subtype
  request_definition {
    method = "GET"
    url    = var.synthetics_url
  }
  assertion {
    type     = var.api_assertion_type
    operator = var.api_assertion_operator
    target   = var.api_assertion_target
  }
  locations = var.synthetics_locations
  options_list {
    tick_every = var.browser_request_frequency
  }
  message = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.notification_targets)}
EOM
  tags = [
    "env:${var.env}",
    "service:${var.service_name}",
    "terraform:true"
  ]
  status = var.synthetics_status
}

# Create Datadog synthetics api/ssl test
resource "datadog_synthetics_test" "test_ssl" {
  count   = (var.enabled && var.synthetics_type == "api" && var.synthetics_subtype == "ssl") ? 1 : 0
  name    = var.name
  type    = var.synthetics_type
  subtype = var.synthetics_subtype
  request_definition {
    host = var.synthetics_url
    port = var.synthetics_ssl_port
  }
  assertion {
    type     = var.ssl_assertion_type
    operator = var.ssl_assertion_operator
    target   = var.ssl_assertion_target
  }
  locations = var.synthetics_locations
  options_list {
    tick_every         = var.synthetics_ssl_request_frequency
    accept_self_signed = var.synthetics_ssl_accept_self_signed
  }
  message = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.notification_targets)}
EOM
  tags = [
    "env:${var.env}",
    "service:${var.service_name}",
    "terraform:true"
  ]
  status = var.synthetics_status
}
