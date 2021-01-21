# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an application load balancer
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf   - random_string.my-random-string.result
# 4c-sg-lb.tf           - [aws_security_group.my-sg-lb.id]
# 1a-vpc.tf             - module.my-vpc.public_subnets
# 7a-s3-bucket.tf       - aws_s3_bucket.my-s3-log-bucket.bucket
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


resource "aws_lb" "my-alb" {
  name                   = "my-alb-${random_string.my-random-string.result}"
  load_balancer_type     = "application"
  security_groups        = [aws_security_group.my-sg-lb.id]
  subnets                = module.my-vpc.public_subnets
  access_logs {
    bucket               = aws_s3_bucket.my-s3-log-bucket.bucket
    enabled              = true
  }
  tags                   = {
    Name                 = "my-alb-${random_string.my-random-string.result}"
    Terraform            = "true"
    Project              = var.my-project-name
    Environment          = var.my-environment
  }
}











