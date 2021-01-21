# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an ecs cluster, task definition & service
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf  - random_string.my-random-string.result
# 03b-ecs-td.tf        - aws_ecs_task_definition.my-ecs-td.arn
# 04e-sg-ecs.tf        - aws_security_group.my-sg-ecs.id
# 01a-vpc.tf           - module.my-vpc.private_subnets
# 05a-lb-alb.tf        - aws_lb_target_group.my-lb-tg.id
# 05b-lb-listeners     - aws_lb_listener.my-lb-listener-http
# 08a-iam-roles.tf     - aws_iam_role_policy_attachment.my-iampa-ecs-task-exec
# variables.tf         - var.my-application
# variables.tf         - var.my-desired-container-count
# variables.tf         - var.my-docker-port


resource "aws_ecs_cluster" "my-ecs-cluster" {
  name                               = "${var.my-application}-cluster-${random_string.my-random-string.result}"
}

resource "aws_ecs_service" "my-ecs-service" {
  name                               = "${var.my-application}-service-${random_string.my-random-string.result}"
  cluster                            = aws_ecs_cluster.my-ecs-cluster.id
  task_definition                    = aws_ecs_task_definition.my-ecs-td.arn
  desired_count                      = var.my-desired-container-count
  launch_type                        = "FARGATE"
  health_check_grace_period_seconds  = 420
  network_configuration {
    security_groups                  = [aws_security_group.my-sg-ecs.id]
    subnets                          = module.my-vpc.private_subnets
    assign_public_ip                 = true
  }
  load_balancer { 
    target_group_arn                 = aws_lb_target_group.my-lb-tg.id
    container_name                   = var.my-application
    container_port                   = var.my-docker-port
  }
  depends_on                         = [aws_lb_listener.my-lb-listener-http, aws_iam_role_policy_attachment.my-iampa-ecs-task-exec]
}
