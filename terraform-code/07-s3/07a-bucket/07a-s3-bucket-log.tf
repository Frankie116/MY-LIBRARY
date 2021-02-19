# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket & bucket policy to enable lb logs to be stored.  (Delete on destroy)
# ---------------------------------------------------------------------------------------------------

# req:
# 30a-random-string.tf   - random_string.my-random-string.result
# variables.tf           - var.my-project-name
# variables.tf           - var.my-environment


resource "aws_s3_bucket" "my-s3-log-bucket" {
  bucket                 = "my-s3-log-bucket-${random_string.my-random-string.result}"
  acl                    = "private"
  force_destroy          = true
  versioning {
    enabled              = true
  }
    tags                 = {
    Name                 = "my-s3-log-bucket-${random_string.my-random-string.result}"
    Terraform            = "true"
    Project              = var.my-project-name
    Environment          = var.my-environment
  }
}