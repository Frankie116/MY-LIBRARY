```sh
## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## Docker cmds can be found here: https://docs.docker.com/engine/reference/commandline/docker/
## ---------------------------------------------------------------------------------------------------

## --------------------------------------------
## Status cmds
## --------------------------------------------
docker ps
docker ps -a

docker images
docker network ls

docker logs mongodb

## list the repositories in an aws registry
aws ecr describe-repositories
aws ecr describe-images --repository-name amazonlinux


## --------------------------------------------
## Login to repo to enable images to be pulled
## --------------------------------------------
docker login

## stdin enables passwords to be passed through non-interactively.
cat ~/my_password.txt | docker login --username foo --password-stdin 

## aws ecr login example
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 396057208705.dkr.ecr.eu-west-2.amazonaws.com



## --------------------------------------------
## Pull docker image cmds
## --------------------------------------------
docker pull redis
docker pull redis:<my-tag>
docker pull docker.io/redis:<my-tag>

## pull from aws ecr
## If you receive a repository-url not found: does not exist or no pull access error, you might need to authenticate 
## your Docker client with Amazon ECR. For more information, see https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry_auth.html
docker pull aws_account_id.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest



## -----------------------------------------------------------------
## Run container cmds (also pulls image if its not found locally)
## -----------------------------------------------------------------

### pull/start single container:
docker run redis
docker run frankie116/my-app
docker run redis:<my-tag> <-d optional> 
docker run -p <my-local-port>:<containerport> redis:<my-tag>

## pull/start single container and name the container
docker run -p 6001:6379 --name <my-container-name> redis:<my-tag>



## -----------------------------------------------------------------
## Pull/start single container using multi-lines
## -----------------------------------------------------------------

### start example mongodb container
docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
--net mongo-network \
--name mongodb \
mongo


## -----------------------------------------------------------------
## Pull/start multiple containers simutaneously using docker-compose 
## file.  This cmd also creates required docker networks
## -----------------------------------------------------------------
docker-compose -f docker-compose.yaml up <-d optional>
docker-compose up <-d optional>

## my-dc-file.yaml (starts 3 containers,"my-app', 'mongodb' & 'mongo-express'):
version: '3'
services:
  my-app:
    image: frankie116/my-app:latest
    ports: 
      - 3000:3000
  mongodb:
    image: mongo
    ports:
     - 27017:27017
    environment:
     - MONGO_INITDB_ROOT_USERNAME=admin
     - MONGO_INITDB_ROOT_PASSWORD=password
  mongo-express:
    image: mongo-express
    ports:
      - 8080:8081
    environment:
      - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
      - ME_CONFIG_MONGODB_ADMINPASSWORD=password
      - ME_CONFIG_MONGODB_SERVER=mongodb



## -----------------------------------------------------------------
## Start a previously stopped container (container already exists)
## -----------------------------------------------------------------
docker start <my-container-name>
docker start <container-id>



## -----------------------------------------------------------------
## SSH to a running container
## -----------------------------------------------------------------
docker exec -it <container-id> /bin/bash
docker exec -it <container-id> /bin/sh
docker exec -it <container-id> sh



## -----------------------------------------------------------------
## Build a new docker image.
## Requires Dockerfile to be found from the within the executing dir. 
## -----------------------------------------------------------------
docker build -t <my-container-name>:<my-tag> .
docker build -t my-app:1.0 .



## -----------------------------------------------------------------
## Tag a docker image - docker.io (default)
## -----------------------------------------------------------------
docker tag <image-id> <my-repo-name>/<my-image-name>:<my-tag>
docker tag b9b1ec84525b frankie116/my-app:latest
docker tag b9b1ec84525b docker.io/frankie116/my-app:latest



## -----------------------------------------------------------------
## Tag a docker image - private/external repo
## -----------------------------------------------------------------

## private repo
docker tag b9b1ec84525b my-private-repo/frankie116/my-app:latest

## aws ecr repo
docker tag my-app:latest 396057208705.dkr.ecr.eu-west-2.amazonaws.com/my-app:latest



## -----------------------------------------------------------------
## Push a docker image to a repo.  Permissions are required.
## -----------------------------------------------------------------

## push to docker.io
docker push frankie116/my-app

## push to aws ecr
docker push 396057208705.dkr.ecr.eu-west-2.amazonaws.com/my-app:latest



## -----------------------------------------------------------------
## Stop container cmds 
## -----------------------------------------------------------------

## stop single container in attached mode (current terminal window frozen):
<CTRL+C>

## stop single container from different terminal window:
docker stop <my-container-name>
docker stop <container-id>

## Stops multiple containers simultaneously. Docker-compose file needs to be found
## from within the executing dir. This cmd also removes related docker networks
docker-compose -f docker-compose.yaml down



## --------------------------------------------
## Create docker network
## --------------------------------------------
docker network create <my-network-id>



## --------------------------------------------
## Delete containers
## --------------------------------------------

## container needs to be stopped before it can be deleted
docker rm <container-id>
docker rm <container-name>

## deletes all containers (that are stopped)
docker rm $(docker ps -a -q)



## --------------------------------------------
## Delete images
## --------------------------------------------

## containers using this image need to be stopped & deleted before image can be deleted
docker rmi <image-name>

docker rmi <image-name>:<tag>


## deletes all images
docker rmi $(docker images -a -q)

## deletes selected images
docker rmi $(<container-id-1> <container-id-2>)

## --------------------------------------------
## Delete networks
## --------------------------------------------
docker network rm <my-network-id>



## --------------------------------------------
## Example
## --------------------------------------------

# 1 - Start docker daemon on workstation
open -a Docker

# 2 - Pull Jenkins container from dockerhub
docker pull frankie116/lab045-docker-image

# 3 - View image on local workstation
docker images

# 4 - View all containers on workstation
docker ps -a

# 5 - Run docker image
docker run -p 8080:8080 --name myjenkinscontainer frankie116/lab045-docker-image:latest

# 6 - open application in browser
http://0.0.0.0:8080/

# 7 - Copy the password displayed in CLI from step 5 & paste into browser


# 8 - Stop container
<CTRL+C>
or
docker stop <container-id>

```











