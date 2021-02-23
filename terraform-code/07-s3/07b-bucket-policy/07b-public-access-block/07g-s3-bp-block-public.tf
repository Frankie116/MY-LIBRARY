


resource "aws_s3_bucket_public_access_block" "my-block-public-access-1" {
  bucket = aws_s3_bucket.my-s3-tf-backend-000.id
  block_public_acls   = true
  block_public_policy = true
}


resource "aws_s3_bucket_public_access_block" "my-block-public-access-2" {
  bucket = aws_s3_bucket.my-s3-tf-backend-logs-000.id
  block_public_acls   = true
  block_public_policy = true
}