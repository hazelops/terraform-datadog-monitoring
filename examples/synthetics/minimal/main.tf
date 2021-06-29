module "datadog_synthetics" {
  source          = "hazelops/monitoring/datadog//modules/synthetics"
  dd_api_key      = "Datadog API Key"
  dd_app_key      = "Datadog APP Key"
  env             = "Your Environment"
  synthetics_name = "Name Your Test"
  synthetics_url  = "https://someurl.com"
  target_names = [
    "@slack-alerts",
    "@user:user@somemail.com"
  ]
}
