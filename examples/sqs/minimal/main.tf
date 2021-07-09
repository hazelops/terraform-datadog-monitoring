module "datadog_sqs_monitor" {
  source         = "hazelops/monitoring/datadog//modules/sqs"
  dd_api_key     = "Datadog API Key"
  dd_app_key     = "Datadog APP Key"
  env            = "your-environment"
  aws_account_id = 1234567890 #your AWS account ID
  monitor_type   = "metric alert"
  queue_name     = "your-sqs-queue"

  notification_targets = [
    "@slack-alerts",
    "@user@somemail.com"
  ]
}
