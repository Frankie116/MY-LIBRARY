# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Uses an existing snapshot named "my-snapshot-latest"
# ---------------------------------------------------------------------------------------------------

# req:
# An existing snapshot named "my-snapshot-latest" needs to be found in local region.
# variables.tf        - var.my-snapshot-name


data "aws_ebs_snapshot" "my-existing-snapshot" {
  most_recent           = true
  owners                = ["self"]
  filter {
    name                = "tag:Name"
    values              = [var.my-snapshot-name]
  }
}