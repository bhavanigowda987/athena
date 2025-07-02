
resource "aws_cloudwatch_log_group" "athena_log_group" {
  name              = "/aws/athena/query"
  retention_in_days = 14
}
