module "apm_monitor" {
  source       = "hazelops/alerts/datadog"
  dd_api_key   = "Datadog API Key"
  dd_app_key   = "Datadog APP Key"
  env          = "dev"
  namespace    = "namespace"
  service_name = "YourServiceName"
  target_names = [
    "@slack-alerts",
    "@user:Some@Email.com"
  ]
}
