## ---------------------------------------------------------------------------------------------------
## version  2.0
## Library: https://github.com/Frankie116/my-library.git
## CloudFormation cmds found here: https://docs.aws.amazon.com/cli/latest/reference/cloudformation/
## ---------------------------------------------------------------------------------------------------


aws cloudformation deploy --template helloworld-task.yaml --stack-name my-new-stack

aws cloudformation describe-stacks --stack-name my-new-stack --query "Stacks[0].Outputs[?OutputKey=='PublicIP'].OutputValue" --output text