# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates iam roles
# ---------------------------------------------------------------------------------------------------

# req:
# variables.tf       - var.my-ecs-task-execution-role-name


data "aws_iam_policy_document" "my-iampd-ecs-task-exec" {
  version            = "2012-10-17"
  statement {
    sid              = ""
    effect           = "Allow"
    actions          = ["sts:AssumeRole"]
    principals {
      type           = "Service"
      identifiers    = ["ecs-tasks.amazonaws.com"]
    }
  }
}
