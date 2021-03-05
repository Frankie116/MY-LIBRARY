# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates auto-scaling policies 
# ---------------------------------------------------------------------------------------------------

# req:
# 03a-ecs-cluster.tf          - aws_ecs_cluster.my-ecs-cluster.name
# 03b-ecs-service.tf          - aws_ecs_service.my-ecs-service.name
# 30a-random-string.tf        - random_string.my-random-string.result
# variables.tf                - var.my-desired-container-count


resource "aws_appautoscaling_target" "my-as-target" {
  service_namespace                 = "ecs"
  resource_id                       = "service/${aws_ecs_cluster.my-ecs-cluster.name}/${aws_ecs_service.my-ecs-service.name}"
  scalable_dimension                = "ecs:service:DesiredCount"
  min_capacity                      = var.my-desired-container-count
  max_capacity                      = 4
}


# Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "my-as-policy-up" {
  name                              = "myapp-scale-up-${random_string.my-random-string.result}"
  service_namespace                 = "ecs"
  resource_id                       = "service/${aws_ecs_cluster.my-ecs-cluster.name}/${aws_ecs_service.my-ecs-service.name}"
  scalable_dimension                = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type                 = "ChangeInCapacity"
    cooldown                        = 60
    metric_aggregation_type         = "Average"
    step_adjustment {
      metric_interval_lower_bound   = 0
      scaling_adjustment            = 1
    }
  }
  depends_on                        = [aws_appautoscaling_target.my-as-target]
}


# Automatically scale capacity down by one
resource "aws_appautoscaling_policy" "my-as-policy-down" {
  name                              = "myapp-scale-down-${random_string.my-random-string.result}"
  service_namespace                 = "ecs"
  resource_id                       = "service/${aws_ecs_cluster.my-ecs-cluster.name}/${aws_ecs_service.my-ecs-service.name}"
  scalable_dimension                = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type                 = "ChangeInCapacity"
    cooldown                        = 60
    metric_aggregation_type         = "Average"
    step_adjustment {
      metric_interval_upper_bound   = 0
      scaling_adjustment            = -1
    }
  }
  depends_on                        = [aws_appautoscaling_target.my-as-target]
}


