# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# local modules are required.


module "my-server" {
  source = "../../my-library/terraform-code/modules/ec2"
  count = 2
  my-tag-name = "my-server"
}
