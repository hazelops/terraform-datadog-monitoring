module "datadog_synthetics" {
  source         = "hazelops/monitoring/datadog//modules/synthetics"
  dd_api_key     = "Datadog API Key"
  dd_app_key     = "Datadog APP Key"
  env            = "Your Environment"
  name           = "Name Your Test"
  service_name   = "Name Of Your Service"
  synthetics_url = "https://someurl.com"
  target_names = [
    "@slack-alerts",
    "@user:user@somemail.com"
  ]
}
