# ---------------------------------------------------------------------------------------------------
# Library: /mygit/frankie116/library/
# Use an existing EIP and create a new eip association
# ---------------------------------------------------------------------------------------------------

# req:
# 02a-ec2-server        - aws_instance.my-server.id
# 30a-random-string.tf  - random_string.my-random-string.result
# variables.tf          - var.my-existing-eip


data "aws_eip" "my-eip" {
  filter {
    name                = "tag:Name"
    values              = [var.my-existing-eip]
  }
}


resource "aws_eip_association" "eip_assoc" {
  instance_id           = aws_instance.my-server.id
  allocation_id         = data.aws_eip.my-eip.id
}