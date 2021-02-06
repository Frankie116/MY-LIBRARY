## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## ---------------------------------------------------------------------------------------------------



Detailed s3 commands can be found here:  https://docs.aws.amazon.com/cli/latest/reference/s3/
## -----------------------------------------------------------------------------------------------

## create bucket in default region
aws s3 mb s3://<my-unique-s3-bucket-name>


## delete bucket in default region.  (will only delete if bucket is empty)
aws s3 rb s3://<my-unique-s3-bucket-name>

## delete bucket in default region and force deletion even if there are files in this bucket.
aws s3 rb s3://<my-unique-s3-bucket-name> --force


## copy existing file in local directory to s3 bucket
aws s3 cp <my-file.xxx> s3://<my-s3-bucket>

## copy ALL files in local directory to s3 bucket
aws s3 cp . s3://<my-s3-bucket> --recursive

## Keeps local directory in sync with specified s3 bucket (by uploading only). 
## i.e This cmd will copy any extra files that is in local folder to s3 to enable local & s3 to be in sync.
## This cmd does NOT delete a file in s3 that is not present in the local folder.  
aws s3 sync . s3://<my-s3-bucket> 

## Keeps local directory in sync with specified s3 bucket (ploading & deleting if necessary.) 
## i.e This cmd will copy/delete any extra files that is in local folder to s3 to enable local & s3 to be in sync.
## This cmd CAN delete a file in s3 that is not present in the local folder.  
aws s3 sync . s3://<my-s3-bucket> --delete


## lists files that are located in s3 bucket
aws s3 ls <my-file.xxx> s3://<my-s3-bucket>

## lists s3 bucket files in json format
aws s3api list-objects --bucket <my-s3-bucket>