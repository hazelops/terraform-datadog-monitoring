data "aws_ssm_parameter" "datadog_api_key" {
  name = "/${var.env}/global/DD_API_KEY"
}

data "aws_ssm_parameter" "datadog_app_key" {
  name = "/${var.env}/global/DD_APP_KEY"
}
