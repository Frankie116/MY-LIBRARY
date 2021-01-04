```sh
## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## All aws cmds found here: https://docs.aws.amazon.com/cli/latest/index.html
## ---------------------------------------------------------------------------------------------------

## --------------------------------------------
## ECS - https://docs.aws.amazon.com/cli/latest/reference/ecs/index.html
## --------------------------------------------

# Create an ecs cluster
    aws ecs create-cluster \
        --cluster-name MyCluster \
        --tags key=key1,value=value1 key=key2,value=value2 key=key3,value=value3


#Delete an ecs cluster
    aws ecs delete-cluster --cluster MyCluster


# Create an ecs service
    aws ecs create-service \
        --cluster MyCluster \
        --service-name MyService \
        --task-definition sample-fargate:1 \
        --desired-count 2 \
        --launch-type FARGATE \
        --platform-version LATEST \
        --network-configuration "awsvpcConfiguration={subnets=[subnet-12344321],securityGroups=[sg-12344321],assignPublicIp=ENABLED}" \
        --tags key=key1,value=value1 key=key2,value=value2 key=key3,value=value3


# Delete an ecs service
    aws ecs delete-service --cluster MyCluster --service MyService1 --force