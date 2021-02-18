## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## ---------------------------------------------------------------------------------------------------

credentials

cat ~/.aws/config
cat ~/.aws/credentials

aws configure --profile aws-devops



aws sts get-caller-identity

aws sts get-caller-identity --profile=desiredProfile