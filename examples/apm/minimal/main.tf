module "datadog_apm_monitor" {
  source       = "hazelops/monitoring/datadog//modules/apm"
  dd_api_key   = "Datadog API Key"
  dd_app_key   = "Datadog APP Key"
  env          = "Your Environment"
  namespace    = "Namespace"
  service_name = "Your Service Name"
  target_names = [
    "@slack-alerts",
    "@user:user@somemail.com"
  ]
}
