# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates security groups
# ---------------------------------------------------------------------------------------------------

#req:
# 01a-vpc.tf            - module.my-vpc.vpc_id
# 30a-random-string.tf  - random_string.my-random-string.result
# variables.tf          - var.my-docker-port
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


resource "aws_security_group" "my-ecs-sg" {
  name                  = "my-ecs-sg-${random_string.my-random-string.result}"
  description           = "controls access to/from the ecs"
  vpc_id                = module.my-vpc.vpc_id
  tags                  = {
      Name              = "my-ecs-sg-${random_string.my-random-string.result}"
      Terraform         = "true"
      Project           = var.my-project-name
      Environment       = var.my-environment
  }
  depends_on            = [aws_security_group.my-lb-sg]
}



