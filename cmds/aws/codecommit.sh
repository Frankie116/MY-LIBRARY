https://docs.aws.amazon.com/codecommit/latest/userguide/getting-started.html#getting-started-create-commit



## --------------------------------------------------------------------------------------------------------------

Open the CodeCommit console at https://console.aws.amazon.com/codesuite/codecommit/home
choose the AWS Region where the repository was created
Find the repository you want to connect to from the list and choose it
Choose Clone URL, and then choose the protocol you want to use when cloning or connecting to the repository.

## --------------------------------------------------------------------------------------------------------------
clone from codecommit to local:

git clone https://git-codecommit.<region>.amazonaws.com/v1/repos/<my-repo-name>

## --------------------------------------------------------------------------------------------------------------
Connect a local repo to the CodeCommit repository


git remote add origin https://git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo

verify:
git remote -v 

--------------------------------------------------------------------------------------------------------------

# use same cmds as used for github (git add, git push, git pull, git remote etc



--------------------------------------------------------------------------------------------------------------

#create a codecommit repository called my-repo
aws codecommit create-repository --repository-name my-repo --repository-description "My Description"
