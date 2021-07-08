module "datadog_apm_monitor" {
  source                     = "hazelops/monitoring/datadog//modules/apm"
  dd_api_key                 = "Datadog API Key"
  dd_app_key                 = "Datadog APP Key"
  enabled                    = true
  latency_enabled            = true
  errors_enabled             = true
  env                        = "your-environment"
  service_name               = "your-service"
  monitor_type               = "metric alert"
  latency_metric             = "trace.flask.request"
  latency_threshold_duration = "last_10m"
  latency_alert_threshold    = "> 0.5"
  error_metric               = "trace.flask.request"
  error_threshold_duration   = "last_10m"
  error_alert_threshold      = "> 0.05"
  notification_targets = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
