Detatiled Terraform cmds - https://www.terraform.io/docs/cli/index.html


## -------------------------------------------------------------------------------------
terraform init
TF_LOG=DEBUG terraform init


## -------------------------------------------------------------------------------------
terraform plan


terraform plan -destroy


terraform plan -out=tfplan      ## output the terraform plan to a file called tfplan
terraform show -json tfplan     ## display that planfile in plain text
## -------------------------------------------------------------------------------------
terraform apply
terraform apply -auto-approve

TF_LOG=DEBUG terraform apply


## -------------------------------------------------------------------------------------
terraform destroy
terraform destroy -auto-approve

TF_LOG=DEBUG terraform detroy


## -------------------------------------------------------------------------------------
terraform state list        ## display existing terraform resources

terraform output            ## display current output that is produced after terraform plan, refresh or apply

terraform output -json      ## display current output in json format.  This output is produced after terraform plan, refresh or apply
## -------------------------------------------------------------------------------------
terraform refresh


## -------------------------------------------------------------------------------------
terraform import module.backend.aws_s3_bucket.my-bucket <your-imported-s3-bucket-name>





terraform plan -destroy