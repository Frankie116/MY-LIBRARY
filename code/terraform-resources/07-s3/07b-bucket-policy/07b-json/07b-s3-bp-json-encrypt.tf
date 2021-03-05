# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket policy to enable access to the s3 encrypted bucket. 
# ---------------------------------------------------------------------------------------------------

# req:
# 07a-s3-bucket-backend  - aws_s3_bucket.my-s3-tf-backend-000.id
# 08b-iampd-state-lock   - data.aws_iam_policy_document.my-iam-pd-tf-state-lock.json


resource "aws_s3_bucket_policy" "my-s3-bp-tf-state-lock" {
  bucket                 = aws_s3_bucket.my-s3-tf-backend-000.id
  policy                 = <<EOF
{
  "Version": "2012-10-17",
  "Id": "RequireEncryption",
   "Statement": [
    {
      "Sid": "RequireEncryptedTransport",
      "Effect": "Deny",
      "Action": ["s3:*"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.my-s3-tf-backend-000.id}/*"],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    },
    {
      "Sid": "RequireEncryptedStorage",
      "Effect": "Deny",
      "Action": ["s3:PutObject"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.my-s3-tf-backend-000.id}/*"],
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      },
      "Principal": "*"
    }
  ]
}
EOF
}