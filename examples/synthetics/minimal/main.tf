module "datadog_synthetics" {
  source         = "hazelops/monitoring/datadog//modules/synthetics"
  dd_api_key     = "Datadog API Key"
  dd_app_key     = "Datadog APP Key"
  env            = "your-environment"
  name           = "Frontend Test"
  service_name   = "your-service"
  synthetics_url = "https://someurl.com"
  notification_targets = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
