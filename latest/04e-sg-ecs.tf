# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates security groups
# ---------------------------------------------------------------------------------------------------

#req:
# 9b-random-string.tf - random_string.my-random-string.result
# 1a-vpc.tf           - module.my-vpc.vpc_id
# variables.tf        - var.my-docker-port
# variables.tf        - var.my-project-name
# variables.tf        - var.my-environment


resource "aws_security_group" "my-ecs-sg" {
  name                   = "my-ecs-sg-${random_string.my-random-string.result}"
  description            = "controls access to/from the ecs"
  vpc_id                 = module.my-vpc.vpc_id
  tags                   = {
      Name               = "my-ecs-sg-${random_string.my-random-string.result}"
      Terraform          = "true"
      Project            = var.my-project-name
      Environment        = var.my-environment
  }
  depends_on = [aws_security_group.my-lb-sg]
}



