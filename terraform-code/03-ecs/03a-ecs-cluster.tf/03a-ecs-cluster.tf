# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an ecs cluster, task definition & service
# ---------------------------------------------------------------------------------------------------

# req:
# 30a-random-string.tf  - random_string.my-random-string.result
# variables.tf          - var.my-application


resource "aws_ecs_cluster" "my-ecs-cluster" {
  name                  = "${var.my-application}-cluster-${random_string.my-random-string.result}"
}
