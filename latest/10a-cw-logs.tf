# ---------------------------------------------------------------------------------------------------
# version  1.4
# Library: https://github.com/Frankie116/my-library.git
# Creates cloudwatch logs
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf   - random_string.my-random-string.result
# variables.tf          - var.my-application


locals {
  my-cw-log-group    = "/ecs/${var.my-application}-${random_string.my-random-string.result}"
}

resource "aws_cloudwatch_log_group" "my-cw-log-group" {
  name               = local.my-cw-log-group
  retention_in_days  = 30
  tags               = {
    Name             = "my-cw-log-group"
  }
}


resource "aws_cloudwatch_log_stream" "my-cw-log-stream" {
  name               = "my-log-stream-${random_string.my-random-string.result}"
  log_group_name     = aws_cloudwatch_log_group.my-cw-log-group.name
}