terraform init
TF_LOG=DEBUG terraform init


# -------------------------------------------------------------------------------------
terraform plan


terraform plan -destroy

# -------------------------------------------------------------------------------------
terraform apply
terraform apply -auto-approve

TF_LOG=DEBUG terraform apply


# -------------------------------------------------------------------------------------
terraform destroy
terraform destroy -auto-approve

TF_LOG=DEBUG terraform detroy


# -------------------------------------------------------------------------------------
terraform import module.backend.aws_s3_bucket.my-bucket <your-imported-s3-bucket-name>





terraform plan -destroy