# Configure the Datadog provider
provider "datadog" {
  api_key = var.dd_api_key
  app_key = var.dd_app_key
}

# Create Datadog syntetics browser site availability test
resource "datadog_synthetics_test" "test_browser" {
  name = var.app_name
  type = var.synthetics_type
  request = {
    method = "GET"
    url = var.synthetics_request_url
  }
  device_ids = var.device_type
  locations  = var.locations_type
  options = var.dd_options
  message = join(" ", ["@${var.email}", "{{#is_alert}} Website", var.synthetics_request_url, "is not available! {{/is_alert}}", "{{^is_alert}} Website", var.synthetics_request_url, "is back to live! {{/is_alert}}"])
  tags = concat(["env:${var.env}", "service:${var.app_name}"], var.synthetics_tags)
  status = "live"
}
