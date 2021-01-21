# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates security group rules
# ---------------------------------------------------------------------------------------------------

#req:
# 4g-sg-jumpbox.tf    - aws_security_group.my-sg-jumpbox.id
# variables.tf        - var.my-docker-port


resource "aws_security_group_rule" "my-sg-irule-jumpbox" {
  description              = "allow only ssh port inbound from anywhere"
  security_group_id        = aws_security_group.my-sg-jumpbox.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 22
  to_port                  = 22
  cidr_blocks              = ["0.0.0.0/0"]
  depends_on = [aws_security_group.my-sg-jumpbox]
}

resource "aws_security_group_rule" "my-sg-erule-jumpbox" {
  description              = "allow any port to exit jumpbox to anywhere"
  security_group_id        = aws_security_group.my-sg-jumpbox.id
  type                     = "egress"
  protocol                 = "-1"
  from_port                = 0
  to_port                  = 0
  cidr_blocks              = ["0.0.0.0/0"]
  depends_on = [aws_security_group.my-sg-jumpbox]
}