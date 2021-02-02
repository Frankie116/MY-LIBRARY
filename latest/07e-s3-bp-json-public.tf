# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket policy to enable public access to the s3 unencrypted bucket. 
# ---------------------------------------------------------------------------------------------------


# req:
# 07a-s3-bucket       - aws_s3_bucket.my-s3-tf-backend-000.arn


# -----------------------------------------------------------------------------------
# Allow public access to s3 bucket
# -----------------------------------------------------------------------------------
resource "aws_s3_bucket_policy" "my-s3-bp-tf-backend" {
  bucket               = aws_s3_bucket.my-s3-tf-backend-000.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my-s3-tf-backend-000/*",
      "Condition": {
      }
    }
  ]
}
POLICY
}