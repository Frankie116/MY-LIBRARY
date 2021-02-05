Detatiled Terraform cmd ref:    https://www.terraform.io/docs/cli/index.html
other ref:                      https://www.terraform.io/docs/cli/state/resource-addressing.html


## -------------------------------------------------------------------------------------
terraform init
TF_LOG=DEBUG terraform init

## -------------------------------------------------------------------------------------
terraform plan

terraform plan -destroy

terraform plan -out=tfplan      ## output the terraform plan to a file called tfplan
terraform show -json tfplan     ## display that plan file in plain text


terraform plan -target module.my_ec2.aws_instance.myec2                 ## display the plan for the targetted resource
terraform plan -target module.my_ec2.aws_instance.myec2 -out run.plan   ## display the plan for the targetted resource & output result to a file
terraform apply "run.plan"                                              ## apply only the changes in the plan file.  Applies plan immediately after execution.  No confirmation required

## -------------------------------------------------------------------------------------
terraform apply                                          ## apply all configuration changes to live infrastructure. Prompt for confirmation before changing infrastructure

terraform apply -auto-approve                            ## apply all configuration changes to live infrastructure. (without prompting for confirmation before changing infrastructure)

terraform apply -refresh=true                            ## apply all configuration changes to live infrastructure.  Do not update each resource state before planning & applying.  

terraform apply -target module.my_ec2.aws_instance.myec2 ## apply configuration changes to specific live infrastructure resource only.

terraform apply -var 'my-servername=new-server'          ## apply all configuration changes to live infrastructure.  Use the specified command line variable in the configuration.

terraform apply -file=varfile                            ## apply all configuration changes to live infrastructure.  Use the specified variables file in the configuration.

TF_LOG=DEBUG terraform apply                             ## apply all configuration changes to live infrastructure with debug info displayed while executing.



## -------------------------------------------------------------------------------------
terraform taint module.my-local-server-1.aws_instance.myec2   ## Marks the specified resource as tainted.  Therefore, this resource will be destroyed and recreated on next apply.
                                                              ## The next plan will show that resource will be destroyed & recreated.  The next apply will implement the change.

terraform untaint module.my-local-server-1.aws_instance.myec2 ## Removes a tainted mark from a specific resource.  Therefore, this resource will no longer be destroyed and recreated on next apply.

## -------------------------------------------------------------------------------------
terraform state list                    ## display list of existing terraform resources.
terraform state show <resource address> ## display detailed info on specific resource.

terraform state rm <resource address>   ## remove the specified resource from the terraform state file.( Therefore, terraform will no longer manage this resource.)


## -------------------------------------------------------------------------------------
terraform output                        ## display current output that is produced after terraform plan, refresh or apply
terraform output -json                  ## display current output in json format.  This output is produced after terraform plan, refresh or apply

## -------------------------------------------------------------------------------------
terraform refresh


## -------------------------------------------------------------------------------------
IMPORT - A resource config is required in terraform before the import cli cmd is used.  i.e:


module "my-local-server-4" {
  source = "../../my-library/modules/ec2"
}


terraform cmd line:
terraform import module.my-local-server-4.aws_instance.myec2 <id of existing resource>

## -------------------------------------------------------------------------------------
terraform destroy

terraform destroy -auto-approve

TF_LOG=DEBUG terraform detroy

## -------------------------------------------------------------------------------------
terraform <command> -help  ##  displays help on specified command