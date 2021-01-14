# ---------------------------------------------------------------------------------------------------
# version  1.7
# Library: https://github.com/Frankie116/my-library.git
# Creates security groups
# ---------------------------------------------------------------------------------------------------

#req:
# 1a-vpc.tf           - module.my-vpc.vpc_id
# 1a-vpc.tf           - module.my-vpc.public_subnets_cidr_blocks
# 9b-random-string.tf - random_string.my-random-string.result
# variables.tf        - var.my-project-name
# variables.tf        - var.my-environment


resource "aws_security_group" "my-server-sg" {
  name                   = "my-server-sg-${random_string.my-random-string.result}"
  description            = "Security group for web-servers with HTTP ports open within VPC"
  vpc_id                 = module.my-vpc.vpc_id
  tags                   = {
    Name                 = "my-server-sg-${random_string.my-random-string.result}"
    Terraform            = "true"
    Project              = var.my-project-name
    Environment          = var.my-environment
  }
}






# ---------------------------------------------------------------------------------------------------
# module "my-server-sg" {
#   source                 = "terraform-aws-modules/security-group/aws//modules/web"
#   version                = "3.12.0"
#   name                   = "my-server-sg"
#   description            = "Security group for web-servers with HTTP ports open within VPC"
#   vpc_id                 = module.my-vpc.vpc_id
#   ingress_cidr_blocks    = module.my-vpc.public_subnets_cidr_blocks
#   tags                   = {
#     Name                 = "my-server-sg-${random_string.my-random-string.result}"
#     Terraform            = "true"
#     Project              = var.my-project-name
#     Environment          = var.my-environment
#   }
# }