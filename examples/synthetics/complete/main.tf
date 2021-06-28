module "terraform_datadog_monitoring" {
  source          = "hazelops/monitoring/datadog//modules/synthetics"
  version         = "~> 1.0"
  enabled         = true
  dd_api_key      = "Datadog API Key"
  dd_app_key      = "Datadog APP Key"
  env             = "test"
  synthetics_name = "test"
  target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
  ]
  synthetics_url        = "http://test.com"
  synthetics_tags       = ["test1", "test2"]
  synthetics_type       = "browser"
  synthetics_subtype    = "http"
  synthetics_device_ids = ["laptop_large"]
  synthetics_locations  = ["aws:us-west-1"]
  synthetics_webtest_options = {
    tick_every = 300
  }
  synthetics_alert_down = "There are some problems on:"
  synthetics_alert_up   = "The problems are gone on:"
  synthetics_api_options = {
    tick_every = 60
  }
  synthetics_api_assertions = [
    {
      type     = "statusCode"
      operator = "is"
      target   = "200"
    }
  ]
  synthetics_ssl_port = "443"
  synthetics_ssl_options = {
    tick_every         = 900
    accept_self_signed = true
  }
  synthetics_ssl_assertions = [
    {
      type     = "certificate"
      operator = "isInMoreThan"
      target   = 30
    }
  ]
  synthetics_status = "live"
}
