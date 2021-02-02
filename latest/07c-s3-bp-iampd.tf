# ---------------------------------------------------------------------------------------------------
# version  1.11
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket policy to enable access to the s3 bucket. 
# ---------------------------------------------------------------------------------------------------


# req:
# 07a-s3-bucket       - aws_s3_bucket.my-s3-tf-backend-000.id
# 08b-iam-policy-doc  - data.aws_iam_policy_document.my-iam-pd-tf-state-lock.json


resource "aws_s3_bucket_policy" "my-s3-bp-tf-state-lock" {
  bucket              = aws_s3_bucket.my-s3-tf-backend-000.id
  policy              = data.aws_iam_policy_document.my-iam-pd-tf-state-lock.json
}

