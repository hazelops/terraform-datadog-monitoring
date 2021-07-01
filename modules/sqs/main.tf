# Creates SQS monitor alert
resource "datadog_monitor" "queue_size_critical" {

  name    = "too many messages in queue"
  query   = "max(${var.sqs_threshold_duration}):max:aws.sqs.${var.sqs_queue_metric}{aws_account:${var.aws_profile},queuename:${var.queuename} > ${var.sqs_critical_value}"
  type    = "metric alert"
  thresholds = {
    ok = var.sqs_normal_value
    warning = var.sqs_warning_value
    critical = var.sqs_critical_value
  }
  renotify_interval = var.renotify_interval
  tags = [
    "env:${var.env}",
    "service:${var.service_name}",
    "terraform:true"
  ]
  message = <<EOM
{{#is_no_data}}Not receiving data on ${var.env}:${var.service_name}{{/is_no_data}}
{{#is_warning}}SQS queue size on ${var.env}:${var.service_name} is more than ${var.sqs_warning_value} {{/is_warning}}
{{#is_alert}}SQS queue size on ${var.env}:${var.service_name} is more than ${var.sqs_critical_value} {{/is_alert}}
{{#is_recovery}}SQS queue size on ${var.env}:${var.service_name} is back to normal{{/is_recovery}}
${join(" ", var.target_names)}
EOM


}


data "aws_sqs_queue" "this" {
  name = "queuename"
}
