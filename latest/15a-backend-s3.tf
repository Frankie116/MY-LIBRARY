# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket used to store the terraform state for this project
# ---------------------------------------------------------------------------------------------------

# req:
# 9b-random-string.tf - random_string.my-random-string.result
# variables.tf        - var.my-vpc-cidr-block
# variables.tf        - var.my-priv-subnet-cidr-blocks
# variables.tf        - var.my-priv-subnets-per-vpc
# variables.tf        - var.my-pub-subnet-cidr-blocks
# variables.tf        - var.my-pub-subnets-per-vpc




terraform {
    backend "s3" {
        bucket         = "my-s3-tf-backend-000"
        key            = "my-state.tfstate"   
        region         = "eu-west-2"                     # Note: DynamoDB table needs to be created in
        dynamodb_table = "my-db-tf-state-lock"           # specific region with LockID as primary key
        }
} 