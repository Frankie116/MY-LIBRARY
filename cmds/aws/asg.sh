scaling activities link:  https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html


To suspend a scaling activity
Open a command-line window and use the register-scalable-target command with the --suspended-state option as follows.

aws application-autoscaling register-scalable-target --service-namespace dynamodb \
  --scalable-dimension dynamodb:table:ReadCapacityUnits --resource-id table/my-table \
  --suspended-state file://config.json

## --------------------------------------------
To only suspend scale-in activities that are triggered by a scaling policy, specify the following in config.json.

{
    "DynamicScalingInSuspended":true
}
## --------------------------------------------
To only suspend scale-out activities that are triggered by a scaling policy, specify the following in config.json.
{
    "DynamicScalingOutSuspended":true
}
## --------------------------------------------
To only suspend scaling activities that involve scheduled actions, specify the following in config.json.
{
    "ScheduledScalingSuspended":true
}
## --------------------------------------------
To suspend all scaling activities
Use the register-scalable-target command with the --suspended-state option as follows.

aws application-autoscaling register-scalable-target --service-namespace dynamodb \
  --scalable-dimension dynamodb:table:ReadCapacityUnits --resource-id table/my-table \
  --suspended-state file://config.json

{
    "DynamicScalingInSuspended":true,
    "DynamicScalingOutSuspended":true,
    "ScheduledScalingSuspended":true
}
## --------------------------------------------
View suspended scaling activities
Use the describe-scalable-targets command to determine which scaling activities are in a suspended state for a scalable target.

aws application-autoscaling describe-scalable-targets --service-namespace dynamodb \
  --scalable-dimension dynamodb:table:ReadCapacityUnits --resource-id table/my-table

{
    "ScalableTargets": [
        {
            "ServiceNamespace": "dynamodb",
            "ScalableDimension": "dynamodb:table:ReadCapacityUnits",
            "ResourceId": "table/my-table",
            "MinCapacity": 1,
            "MaxCapacity": 20,
            "SuspendedState": {
                "DynamicScalingOutSuspended": true,
                "DynamicScalingInSuspended": true,
                "ScheduledScalingSuspended": true
            },
            "CreationTime": 1558125758.957,
            "RoleARN": "arn:aws:iam::123456789012:role/aws-service-role/dynamodb.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_DynamoDBTable"
        }
    ]
}
## --------------------------------------------
Resume scaling activities
When you are ready to resume the scaling activity, you can resume it using the register-scalable-target command.
The following example command resumes all scaling activities for the specified scalable target.

aws application-autoscaling register-scalable-target --service-namespace dynamodb \
  --scalable-dimension dynamodb:table:ReadCapacityUnits --resource-id table/my-table \
  --suspended-state file://config.json
  
## --------------------------------------------
#!/bin/bash

aws autoscaling complete-lifecycle-action --lifecycle-action-result CONTINUE --lifecycle-hook-name LaunchHook --auto-scaling-group-name demo-asg-launch-template --instance-id i-XXXXXXXXXXXX --region eu-west-1 --profile aws-devops

# lifecycle token can also be used instead of --instance-id if Lambda is used for example


https://github.com/aws-samples/aws-lambda-lifecycle-hooks-function
