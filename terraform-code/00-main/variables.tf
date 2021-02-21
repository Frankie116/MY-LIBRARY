# ---------------------------------------------------------------------------------------------------
# version  2.0
# Library: https://github.com/Frankie116/my-library.git
# variables used in this project
# ---------------------------------------------------------------------------------------------------

# req:
# None


# various ----------------------------------------------------------------
variable "my-region-name" {
  description           = "The AWS region things are created in"
  default               = "London"
}

variable my-project-name {
  description           = "Name of the project. Used in resource names and tags."
  type                  = string
  default               = "lab000"
}

variable my-environment {
  description           = "Value of the 'Environment' tag."
  type                  = string
  default               = "dev"
}


# 01a-vpc.tf -------------------------------------------------------------
variable my-vpc-cidr-block {
  description           = "CIDR block for VPC"
  type                  = string
  default               = "10.0.0.0/16"
}

variable my-priv-subnets-per-vpc {
  description           = "Number of private subnets. Maximum of 16."
  type                  = number
  default               = 2
}

variable my-priv-subnet-cidr-blocks {
  description           = "Available cidr blocks for private subnets"
  type                  = list(string)
  default               = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
    "10.0.10.0/24",
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24",
    "10.0.14.0/24",
    "10.0.15.0/24",
    "10.0.16.0/24"
  ]
}

variable my-pub-subnets-per-vpc {
  description           = "Number of public subnets. Maximum of 16."
  type                  = number
  default               = 2
}

variable my-pub-subnet-cidr-blocks {
  description           = "Available cidr blocks for public subnets"
  type                  = list(string)
  default               = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
    "10.0.109.0/24",
    "10.0.110.0/24",
    "10.0.111.0/24",
    "10.0.112.0/24",
    "10.0.113.0/24",
    "10.0.114.0/24",
    "10.0.115.0/24",
    "10.0.116.0/24"
  ]
}


# 02a-ec2-server ----------------------------------------------------------------------
variable "my-ami" {
    default = "default-ami"
}

variable "my-ami-name" {
    default = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "my-ami-owners" {
    default = "amazon"
}

variable my-instances-per-subnet {
  description = "Number of EC2 instances in each private subnet"
  type = number
  default = 1
}

variable my-instance-type {
  description = "Type of EC2 instance to use."
  type        = string
  default     = "t2.micro"
}

variable my-instance-name {
    default = "my-ansible-slave"
}


# 03a-ecs-service --------------------------------------------------------------
variable "my-desired-container-count" {
  description           = "Number of docker containers to run"
  default               = 1
}

variable "my-application" {
    default             = "my-app"
} 


# 03b-ecs-td -------------------------------------------------------------------
variable "my-desired-fargate-cpu" {
  description           = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default               = "256"
}

variable "my-desired-fargate-memory" {
  description           = "Fargate instance memory to provision (in MiB)"
  default               = "512"
}


# 04b-sg-rules.tf -------------------------------------------------------------
variable "my-port-app1" {
  description           = "Application port exposed"
  default               = 80
}


# 05a-lb-tg ----------------------------------------------------------------
variable "my-hc-path" {
  default               = "/"
}

variable "my-hc-interval" {
  default               = "30"
}


# 06a-dns-zone.tf -----------------------------------------------------------
variable "my-existing-dns-zone" {
    default             = "redacted.com"    # this variable should point to an exiting r53 hosted zone
}


# 06b-dns-record.tf -------------------------------------------------------------
variable "my-lb-hosted-zone" {
    default             = "ZHREDACTEDK8"
} 


# 08a-iam-roles ------------------------------------------------------------
variable "my-ecs-task-execution-role-name" {
  description           = "ECS task execution role name"
  default               = "myEcsTaskExecutionRole"
}



# 16a-dynamodb-table.tf -------------------------------------------------------
variable "my-db-tablename" {
  type                  = string
  default               = "my-statelock"
}

variable "my-db-read-capacity" {
  type                  = number
  default               = 1
}

variable "my-db-write-capacity" {
  type                  = number
  default               = 1
}

variable "my-db-hash-key" {
   type                 = string
    default             = "LockID"
}
variable "my-db-range-key" {
    type                = string
    default             = "Digest"
}


# 31a-template-file ------------------------------------------------------------
variable "my-docker-image" {
  description           = "name of docker image"
  default               = "nginx"
}

variable "my-ecs-cd-file" {
  description           = "ecs container definition file"
  default               = "my-ecs-cd-template.json.tpl"
}



# 32a-keypair.tf ---------------------------------------------------------------------
variable "my-private-key" {
    default = "my-priv-keyname"
}

variable "my-public-key" {
    default = "ssh-rsa REDACTED-AAAABBBBBBCCCCCC"
}