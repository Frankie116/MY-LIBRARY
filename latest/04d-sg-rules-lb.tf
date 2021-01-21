# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates security group rules
# ---------------------------------------------------------------------------------------------------

#req:
# 4c-sg-lb.tf            - aws_security_group.my-sg-lb.id
# 4a-sg-server.tf        - aws_security_group.my-sg-server.id
# variables.tf           - var.my-port-app1


resource "aws_security_group_rule" "my-lb-ingress1" {
  description              = "allow only app1 port inbound from anywhere"
  security_group_id        = aws_security_group.my-sg-lb.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = var.my-port-app1
  to_port                  = var.my-port-app1
  cidr_blocks              = ["0.0.0.0/0"]
  depends_on = [aws_security_group.my-sg-lb,aws_security_group.my-sg-server]
}


resource "aws_security_group_rule" "my-lb-ingress2" {
  description              = "allow only https inbound from anywhere"
  security_group_id        = aws_security_group.my-sg-lb.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 443
  to_port                  = 443
  cidr_blocks              = ["0.0.0.0/0"]
  depends_on = [aws_security_group.my-sg-lb,aws_security_group.my-sg-server]
}
resource "aws_security_group_rule" "my-lb-egress" {
  description              = "allow any port to exit alb to anywhere"
  security_group_id        = aws_security_group.my-sg-lb.id
  type                     = "egress"
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
  cidr_blocks              = ["0.0.0.0/0"]
  depends_on = [aws_security_group.my-sg-lb,aws_security_group.my-sg-server]
}