https://aws.amazon.com/systems-manager/


## ------------------------------------------------------------------
## Check if SSM agent is running

sudo systemctl status amazon-ssm-agent

## setup ssm agent on an 'on-premise' instance 

#!/bin/bash
mkdir /tmp/ssm
curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -o /tmp/ssm/amazon-ssm-agent.rpm
ls /tmp/ssm
sudo yum install -y /tmp/ssm/amazon-ssm-agent.rpm
sudo systemctl stop amazon-ssm-agent

# Open SSM/Hybrid Activations
# Create a system default command executioin role that has the required permissions (AmazonEC2RunCommandRoleForManagedInstances)
# leave expiry date & default instance name blank.
# Create activation to get the following:
# Activation Code = abc
# Activation ID = xyz


# edit the code, id and region in the command below
sudo amazon-ssm-agent -register -code "activation-code-abc" -id "activation-id-xyz" -region "region"
sudo systemctl start amazon-ssm-agent


## ------------------------------------------------------------------
## Example command to use an SSM RUN Command on a managed instance


aws ssm send-command --document-name "AWS-RunShellScript" --document-version "1" 
--targets '[{"Key":"resource-groups:Name","Values":["MyEC2DevelopmentInstances"]}]' 
--parameters '{"workingDirectory":[""],"executionTimeout":["3600"],"commands":["sudo yum install -y httpd"]}' 
--timeout-seconds 600 --max-concurrency "50" --max-errors "0" --output-s3-bucket-name "my-ssm-bucket" 
--output-s3-key-prefix "RunCommands" --cloud-watch-output-config '{"CloudWatchOutputEnabled":true}' --region eu-west-2


## ------------------------------------------------------------------
## SSM Parameter Store

# GET PARAMETERS
aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password

# GET PARAMETERS WITH DECRYPTION
aws ssm get-parameters --names /my-app/dev/db-url /my-app/dev/db-password --with-decryption

# GET PARAMETERS BY PATH
aws ssm get-parameters-by-path --path /my-app/dev/

# GET PARAMETERS BY PATH RECURSIVE
aws ssm get-parameters-by-path --path /my-app/ --recursive

# GET PARAMETERS BY PATH WITH DECRYPTION
aws ssm get-parameters-by-path --path /my-app/ --recursive --with-decryption