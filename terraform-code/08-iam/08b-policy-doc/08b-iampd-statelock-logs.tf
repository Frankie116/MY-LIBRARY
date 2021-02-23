# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an IAM policy document.   This defines the access granted on specific resources.  
# ---------------------------------------------------------------------------------------------------

# req:
# 07a-s3-bucket-backend  - aws_s3_bucket.my-s3-tf-backend-000.arn
# variables.tf           - var.kms_key_id


data "aws_iam_policy_document" "my-iam-pd-tf-state-lock-logs" {
  statement {
    sid                  = "RequireEncryptedTransport"
    effect               = "Deny"
    actions              = ["s3:*",]
    resources            = ["${aws_s3_bucket.my-s3-log-bucket.arn}/*",]
    condition {
      test               = "Bool"
      variable           = "aws:SecureTransport"
      values             = [false,]
    }
    principals {
      type               = "*"
      identifiers        = ["*"]
    }
  }

  statement {
    sid                  = "RequireEncryptedStorage"
    effect               = "Deny"
    actions              = ["s3:PutObject",]
    resources            = ["${aws_s3_bucket.my-s3-log-bucket.arn}/*",]
    condition {
      test               = "StringNotEquals"
      variable           = "s3:x-amz-server-side-encryption"
      values             = [var.kms_key_id == "" ? "AES256" : "aws:kms",]
    }
    principals {
      type               = "*"
      identifiers        = ["*"]
    }
  }
}