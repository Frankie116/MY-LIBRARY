# resource "aws_instance" "myinstance" {
#   ami = "ami-0a669382ea0feb73a"                       #london ami
#   instance_type          = "t2.micro"
#   tags = {
#     Name = "My Instance"
#   }
# }

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "frank-test-oct-01-2020"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
