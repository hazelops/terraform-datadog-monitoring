module "datadog_synthetics_test" {
  source                            = "hazelops/monitoring/datadog//modules/synthetics"
  enabled                           = true
  dd_api_key                        = "Datadog API Key"
  dd_app_key                        = "Datadog APP Key"
  env                               = "your-environment"
  name                              = "your-test-name"
  service_name                      = "your-service"
  synthetics_url                    = "https://someurl.com"
  synthetics_type                   = "browser"
  synthetics_subtype                = "laptop_large"
  synthetics_locations              = ["aws:us-west-1"]
  synthetics_device_ids             = ["laptop_large"]
  browser_request_frequency         = 300
  synthetics_alert_down_message     = "There are some problems on:"
  synthetics_alert_up_message       = "The problems are gone on:"
  api_request_frequency             = 60
  api_assertion_type                = "statusCode"
  api_assertion_operator            = "is"
  api_assertion_target              = "200"
  synthetics_ssl_port               = "443"
  synthetics_ssl_request_frequency  = 900
  synthetics_ssl_accept_self_signed = true
  ssl_assertion_type                = "certificate"
  ssl_assertion_operator            = "isInMoreThan"
  ssl_assertion_target              = 30
  synthetics_status                 = "live"
  target_names = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
