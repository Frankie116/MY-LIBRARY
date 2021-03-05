# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# Creates an s3 bucket used to store the terraform state for this project
# ---------------------------------------------------------------------------------------------------

# req:
# none


terraform {
    backend "s3" {
        bucket         = "my-s3-tf-backend-000"
        encrypt        = true
        key            = "my-state.tfstate"   
        region         = "eu-west-2"                     # Note: DynamoDB table needs to be created in
        dynamodb_table = "my-db-tf-state-lock"           # specific region with LockID as primary key
        }
} 