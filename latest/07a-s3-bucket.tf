# ---------------------------------------------------------------------------------------------------
# version  1.11
# Library: https://github.com/Frankie116/my-library.git
# Creates an encrypted s3 bucket.
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf   - random_string.my-random-string.result
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


resource "aws_s3_bucket" "my-s3-tf-backend-000" {
  bucket = var.my-s3-bucket-name
  acl    = "private"
  versioning {
    enabled = true
  }
  # logging {
  #   target_bucket = aws_s3_bucket.tf_backend_logs_bucket.id
  #   target_prefix = "log/"
  # }
  tags = {
    # Description        = "Terraform S3 Backend bucket which stores the terraform state for account ${data.aws_caller_identity.current.account_id}."
    Terraform           = "true"
    Project             = var.my-project-name
    Environment         = var.my-environment
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = var.kms_key_id == "" ? "AES256" : "aws:kms"
      }
    }
  }
  # lifecycle {
  #   prevent_destroy = true
  # }
}



