module "datadog_synthetics" {
  source         = "hazelops/monitoring/datadog//modules/synthetics"
  dd_api_key     = "Datadog API Key"
  dd_app_key     = "Datadog APP Key"
  env            = "your-environment"
  name           = "your-test-name"
  service_name   = "your-service"
  synthetics_url = "https://someurl.com"
  target_names = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
