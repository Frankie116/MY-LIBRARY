# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an ecs cluster, task definition & service
# ---------------------------------------------------------------------------------------------------

# req:
# 08a-iamrole-ecs-te.tf      - aws_iam_role.my-iamrole-ecs-task-exec.arn
# 08b-iampd-ecs-te.tf        - aws_iam_role_policy_attachment.my-iampa-ecs-task-exec
# 30a-random-string.tf       - random_string.my-random-string.result
# 31a-template-file.tf       - data.template_file.my-script.rendered
# variables.tf               - var.my-desired-fargate-cpu
# variables.tf               - var.my-desired-fargate-memory


resource "aws_ecs_task_definition" "my-ecs-td" {
  family                     = "my-ecs-td-family-${random_string.my-random-string.result}"
  execution_role_arn         = aws_iam_role.my-iamrole-ecs-task-exec.arn
  network_mode               = "awsvpc"
  requires_compatibilities   = ["FARGATE"]
  cpu                        = var.my-desired-fargate-cpu
  memory                     = var.my-desired-fargate-memory
  container_definitions      = data.template_file.my-template-file.rendered
}
