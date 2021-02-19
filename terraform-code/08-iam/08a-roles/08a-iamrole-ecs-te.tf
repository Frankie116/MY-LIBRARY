# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates iam roles
# ---------------------------------------------------------------------------------------------------

# req:
# 08a-iamrole-ecs-te  - data.aws_iam_policy_document.my-iampd-ecs-task-exec.json
# variables.tf        - var.my-ecs-task-execution-role-name


resource "aws_iam_role" "my-iamrole-ecs-task-exec" {
  name                = var.my-ecs-task-execution-role-name
  assume_role_policy  = data.aws_iam_policy_document.my-iampd-ecs-task-exec.json
}

resource "aws_iam_role_policy_attachment" "my-iampa-ecs-task-exec" {
  role                = aws_iam_role.my-iamrole-ecs-task-exec.name
  policy_arn          = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}