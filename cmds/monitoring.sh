## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## cmds can be found here: 
## ---------------------------------------------------------------------------------------------------




To view the status of all instances, use the following command.
aws ec2 describe-instance-status

## ---------------------------------------------------------------------------------------------------
To get the status of all instances with an instance status of impaired, use the following command.
aws ec2 describe-instance-status \
    --filters Name=instance-status.status,Values=impaired

## ---------------------------------------------------------------------------------------------------
To get the status of a single instance, use the following command.
    aws ec2 describe-instance-status \
    --instance-ids <i-1234567890abcdef0>

## ---------------------------------------------------------------------------------------------------
Use the following list-metrics command to view the available Amazon CloudWatch metrics for Amazon EC2.
aws cloudwatch list-metrics --namespace AWS/EC2

## ---------------------------------------------------------------------------------------------------
Use the following put-metric-alarm command to create the alarm.
aws cloudwatch put-metric-alarm --alarm-name StatusCheckFailed-Alarm-for-i-1234567890abcdef0 --metric-name StatusCheckFailed --namespace AWS/EC2 --statistic Maximum --dimensions Name=InstanceId,Value=i-1234567890abcdef0 --unit Count --period 300 --evaluation-periods 2 --threshold 1 --comparison-operator GreaterThanOrEqualToThreshold --alarm-actions arn:aws:sns:us-west-2:111122223333:my-sns-topic

## ---------------------------------------------------------------------------------------------------