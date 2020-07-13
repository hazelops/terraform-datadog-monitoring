# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

resource "datadog_synthetics_test" "test_browser" {
  type = var.syntetics_type

  request = var.synthetics_request

  device_ids = var.device_type

  locations  = var.locations_type

  options = {
    tick_every = 300
  }

  name = var.app_name
  message = "@dmitry.borisov@hazelops.com ###{{#is_alert}} Website is not available! {{/is_alert}} ###{{^is_alert}} Website is back to live !!! {{/is_alert}}"

  tags = concat(["env:${var.env}", "service:${var.app_name}"], var.syntetics_tags)

  status = "live"

}