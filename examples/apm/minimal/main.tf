module "datadog_apm_monitor" {
  source       = "hazelops/monitoring/datadog//modules/apm"
  dd_api_key   = "Datadog API Key"
  dd_app_key   = "Datadog APP Key"
  env          = "your-environment"
  name         = "your-test-name"
  service_name = "your-service"
  target_names = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
