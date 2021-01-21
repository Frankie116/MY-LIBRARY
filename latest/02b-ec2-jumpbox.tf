# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# 1a-vpc.tf             - module.my-vpc.private_subnets
# 02d-ami-amazon2.tf    - data.aws_ami.my-ami-amazon2.id
# 04g-sg-jumpbox.tf     - [aws_security_group.my-sg-jumpbox.id]
# variables.tf          - var.my-private-key
# variables.tf          - var.my-instance-type
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


locals {
  jumpbox-count               = length(module.my-vpc.private_subnets)
}

resource "aws_instance" "my-jumpbox" {
  count                       = local.jumpbox-count
  ami                         = data.aws_ami.my-ami-amazon2.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.public_subnets[count.index % length(module.my-vpc.public_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-jumpbox.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  tags                        = {
    Name                      = "my-jumpbox-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = var.my-environment
    Terraform                 = "true"
  }
}