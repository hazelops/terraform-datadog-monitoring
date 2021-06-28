module "terraform_datadog_monitoring" {
  source          = "hazelops/monitoring/datadog//modules/synthetics"
  dd_api_key      = "Datadog API Key"
  dd_app_key      = "Datadog APP Key"
  env             = "test"
  synthetics_name = "test"
  target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
  ]
  synthetics_url = "http://test.com"
}
