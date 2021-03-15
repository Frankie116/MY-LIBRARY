## ---------------------------------------------------------------------------------------------------
## version  2.0
## Library: https://github.com/Frankie116/my-library.git
## CloudFormation cmds found here: https://docs.aws.amazon.com/cli/latest/reference/cloudformation/
## CloudFormation userguide found here: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html
## CloudFormation standard templates found here: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html
## ---------------------------------------------------------------------------------------------------


aws cloudformation deploy --template helloworld-task.yaml --stack-name my-new-stack

aws cloudformation describe-stacks --stack-name my-new-stack --query "Stacks[0].Outputs[?OutputKey=='PublicIP'].OutputValue" --output text

## ---------------------------------------------------------------------------------------------------

## The following log file is created on an ec2 when a user-data script is executed at boot time:
cat /var/log/cloud-init-output.log

Also to...[?]
cat /var/log/cloud-init.log


## The following log file is created on an ec2 when a cfn-init script is executed at boot time:
cat /var/log/cfn.init.log




## -----------------------------------------

## -----------------------------------------