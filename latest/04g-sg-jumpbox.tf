# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates security groups
# ---------------------------------------------------------------------------------------------------

#req:
# 9b-random-string.tf - random_string.my-random-string.result
# 1a-vpc.tf           - module.my-vpc.vpc_id
# variables.tf        - var.my-project-name
# variables.tf        - var.my-environment



resource "aws_security_group" "my-sg-jumpbox" {
  name                  = "my-sg-jumpbox-${random_string.my-random-string.result}"
  description           = "Security group for jumpboxes with ssh ports open"
  vpc_id                = module.my-vpc.vpc_id
  tags                  = {
    Name                = "my-sg-jumpbox-${random_string.my-random-string.result}"
    Terraform           = "true"
    Project             = var.my-project-name
    Environment         = var.my-environment
  }
}