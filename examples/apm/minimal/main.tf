module "datadog_apm_monitor" {
  source       = "hazelops/monitoring/datadog//modules/apm"
  dd_api_key   = "Datadog API Key"
  dd_app_key   = "Datadog APP Key"
  env          = "your-environment"
  service_name = "your-service"
  notification_targets = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
