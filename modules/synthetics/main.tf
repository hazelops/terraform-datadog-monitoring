# Create Datadog synthetics browser site availability test
resource "datadog_synthetics_test" "test_browser" {
  count = (var.enabled && var.synthetics_type == "browser") ? 1 : 0
  name  = var.synthetics_name
  type  = var.synthetics_type
  request = {
    method = "GET"
    url    = var.synthetics_url
  }
  device_ids = var.synthetics_device_ids
  locations  = var.synthetics_locations
  options    = var.synthetics_webtest_options
  message    = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.target_names)}
EOM

  tags = [
    "env:${var.env}",
    "service:${var.synthetics_name}",
    var.synthetics_tags,
    "Managed by Terraform"
  ]
  status = var.synthetics_status
}

# Create Datadog synthetics api/http test
resource "datadog_synthetics_test" "test_api" {
  count   = (var.enabled && var.synthetics_type == "api" && var.synthetics_subtype == "http") ? 1 : 0
  type    = var.synthetics_type
  subtype = var.synthetics_subtype
  request = {
    method = "GET"
    url    = var.synthetics_url
  }
  assertions = var.synthetics_api_assertions
  locations  = var.synthetics_locations
  options    = var.synthetics_api_options
  name       = "An API test on ${var.synthetics_url}"

  message = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.target_names)}
EOM

  tags = [
    "env:${var.env}",
    "service:${var.synthetics_name}",
    var.synthetics_tags,
    "Managed by Terraform"
  ]
  status = var.synthetics_status
}

# Create Datadog synthetics api/ssl test
resource "datadog_synthetics_test" "test_ssl" {
  count   = (var.enabled && var.synthetics_type == "api" && var.synthetics_subtype == "ssl") ? 1 : 0
  type    = var.synthetics_type
  subtype = var.synthetics_subtype
  request = {
    host = var.synthetics_url
    port = var.synthetics_ssl_port
  }
  assertions = var.synthetics_ssl_assertions
  locations  = var.synthetics_locations
  options    = var.synthetics_ssl_options
  name       = "An API/SSL test on ${var.synthetics_url}"
  message    = <<EOM
{{#is_no_data}}Not receiving data on ${var.synthetics_url}{{/is_no_data}}
{{#is_alert}}${var.synthetics_alert_down_message} ${var.synthetics_url}{{/is_alert}}
{{^is_alert}}${var.synthetics_alert_up_message} ${var.synthetics_url}{{/is_alert}}
${join(" ", var.target_names)}
EOM

  tags = [
    "env:${var.env}",
    "service:${var.synthetics_name}",
    var.synthetics_tags,
    "Managed by Terraform"
  ]
  status = var.synthetics_status
}
