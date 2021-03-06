# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# main.tf                - local.instance-count (also used by other module)
# 01a-vpc.tf             - module.my-vpc.private_subnets[count.index]
# 02b-ami-amazon2.tf     - data.aws_ami.my-ami-amazon2.id
# 02b-ami-snapshot.tf    - aws_ami.my-ami-snapshot.id
# 04a-sg-server.tf       - [aws_security_group.my-sg-server.id]
# 31a-template-file.tf   - data.template_file.my-user-data.rendered
# variables.tf           - var.my-instances-per-subnet
# variables.tf           - var.use-snapshot
# variables.tf           - var.my-instance-type
# variables.tf           - var.my-servername
# variables.tf           - var.my-project-name
# variables.tf           - var.my-environment


locals {
  ami-mapping            = {
    true                 = aws_ami.my-ami-snapshot.id
    false                = data.aws_ami.my-ami-amazon2.id, 
    }
  instance-count         = var.my-instances-per-subnet * length(module.my-vpc.private_subnets)
}


resource "aws_instance" "my-server" {
  count                  = local.instance-count
  ami                    = lookup(local.ami-mapping, var.use-snapshot, "This option should never get chosen")
  instance_type          = var.my-instance-type
  subnet_id              = module.my-vpc.private_subnets[count.index % length(module.my-vpc.private_subnets)]
  vpc_security_group_ids = [aws_security_group.my-sg-server.id]
  user_data              = data.template_file.my-user-data.rendered
  tags                   = {
    Name                 = "${var.my-servername}-0${count.index+1}" 
    Project              = var.my-project-name
    Environment          = var.my-environment
    Terraform            = "true"
  }
}
