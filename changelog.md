BRANCH "master" 
Changelog-001
created initial configs

Changelog-002
Refactored code

Changelog-003
Refactored code

Changelog-004
Refactored code.
Added various code files

Changelog-005
Refactored code.
updated route53.tf

Changelog-006
re-organised library structure & added new folders.
created docker-cmds.md

Changelog-007
split 12-ecs.tf into 12a-ecs-service.tf & 12b-ecs-td.tf
updated 09c, 11a & docker-cmds.md

Changelog-008
added 14a & 14b docker tf files

Changelog-009
Added diagrams folder

Changelog-010
updated output.tf

Changelog-011
updated aws, docker, git, nodejs & terraform cmds

Changelog-012
        deleted:    latest/01a-vpc.tf
        modified:   latest/05b-lb-listeners.tf
        modified:   latest/05c-lb-tg.tf
        modified:   latest/06a-route53.tf
        modified:   latest/09c-template-file.tf
        modified:   latest/10a-cw-logs.tf
        modified:   latest/11a-auto_scaling.tf
        deleted:    latest/12a-ecs-service.tf
        deleted:    latest/12b-ecs-td.tf
        modified:   latest/outputs.tf
        modified:   latest/variables.tf

        Untracked files:
        latest/01a-vpc copy.tf
        latest/03a-ecs-service.tf
        latest/03b-ecs-td.tf
        latest/provider.tf


Changelog-013
        deleted:    latest/04a-sg.tf
        deleted:    latest/04b-sg.tf
        deleted:    latest/04c-sg-rules.tf
        deleted:    latest/10b-cw-alarms..tf
        modified:   diagrams/NETWORK DIAGRAM-APP02.jpg
        modified:   latest/05a-lb-alb.tf
        modified:   latest/05c-lb-tg.tf
        modified:   latest/07a-s3-bucket.tf

        Untracked files:
        diagrams/NETWORK DIAGRAM-TF06-v0.4.jpg
        latest/04a-sg-server.tf
        latest/04b-sg-rules-server.tf
        latest/04c-sg-lb.tf
        latest/04d-sg-rules-lb.tf
        latest/04e-sg-ecs.tf
        latest/04f-sg-rules-ecs.tf
        latest/10b-cw-alarms.tf


Changelog-014
        modified:   changelog.md
        deleted:    cmds/aws.md
        deleted:    latest/02a-ec2-choose-ami.tf
        modified:   latest/02b-ami-amazon2.tf
        modified:   latest/04a-sg-server.tf
        modified:   latest/04b-sg-rules-server.tf
        deleted:    latest/04d-sg-rules-lb.tf
        deleted:    latest/06a-route53.tf
        modified:   latest/outputs.tf

        Untracked files:
        cmds/aws/
        latest/02a-ec2.tf
        latest/02d-ec2-choose-ami.tf
        latest/06a-route53-lb.tf
        latest/06b-route53.tf


Changelog-015
        modified:   changelog.md
        deleted:    docs/Elastic Load Balancing endpoints and quotas - AWS General Reference.htm
        modified:   latest/01a-vpc.tf
        deleted:    latest/02a-ec2.tf
        deleted:    latest/02b-ami-amazon2.tf
        deleted:    latest/02c-ami-snapshot.tf
        deleted:    latest/02d-ec2-choose-ami.tf
        modified:   latest/03a-ecs-service.tf
        modified:   latest/03b-ecs-td.tf
        modified:   latest/04a-sg-server.tf
        modified:   latest/04b-sg-rules-server.tf
        modified:   latest/04c-sg-lb.tf
        modified:   latest/04e-sg-ecs.tf
        modified:   latest/04f-sg-rules-ecs.tf
        modified:   latest/05a-lb-alb.tf
        modified:   latest/05b-lb-listeners.tf
        modified:   latest/05c-lb-tg.tf
        deleted:    latest/06a-route53-lb.tf
        deleted:    latest/06b-route53.tf
        modified:   latest/07a-s3-bucket.tf
        modified:   latest/08a-iam-roles.tf
        deleted:    latest/09a-snapshot.tf
        modified:   latest/09b-random-string.tf
        modified:   latest/09c-template-file.tf
        modified:   latest/10a-cw-logs.tf
        modified:   latest/10b-cw-alarms.tf
        modified:   latest/11a-auto_scaling.tf
        modified:   latest/14a-docker-container.tf
        modified:   latest/14b-docker-image.tf
        modified:   latest/main.tf
        modified:   latest/outputs.tf
        modified:   latest/provider.tf
        modified:   latest/variables.tf

        Untracked files:
        cmds/aws/cli.md
        cmds/linux.md
        cmds/vim.md
        cmds/wordpress.md
        docs/known-issues.md
        latest/02a-ec2-snapshot.tf
        latest/02b-ec2-jumpbox.tf
        latest/02d-ami-amazon2.tf
        latest/02e-ami-snapshot.tf
        latest/02f-ec2-choose-ami.tf
        latest/02g-keypair.tf
        latest/04d-sg-rules-lb.tf
        latest/04g-sg-jumpbox.tf
        latest/04h-sg-rules-jumpbox.tf
        latest/06a-route53-zone.tf
        latest/06b-route53-record-lb.tf
        latest/06c-route53-record-server.tf
        latest/06d-route53-record-jumpbox.tf
        latest/12a-ebs-snapshot.tf
        latest/changelog.md


Changelog-016
        modified:   changelog.md
        modified:   cmds/aws/cli.md
        modified:   cmds/terraform.md
        modified:   cmds/wordpress.md
        modified:   latest/07a-s3-bucket.tf
        deleted:    latest/09c-template-file.tf
        modified:   latest/variables.tf
        modified:   modules/ec2/outputs.tf

        Untracked files:
        cmds/aws/s3.md
        latest/07b-s3-bucket-policy.tf
        latest/07c-s3-bucket-&-policy.tf
        latest/08b-iam-policy-doc.tf
        latest/09c-random-pet.tf
        latest/09d-template-file.tf
        latest/15a-backend-s3.tf
        latest/16a-dynamodb-table.tf


Changelog-017
      modified:   changelog.md
        modified:   cmds/aws/s3.md
        modified:   cmds/git.md
        modified:   cmds/linux.md
        modified:   cmds/terraform.md
        modified:   cmds/wordpress.md
        modified:   latest/07a-s3-bucket.tf
        modified:   latest/07b-s3-bucket-policy.tf
        modified:   latest/07c-s3-bucket-&-policy.tf
        modified:   latest/08b-iam-policy-doc.tf
        modified:   latest/09c-random-pet.tf
        modified:   latest/09d-template-file.tf
        modified:   latest/16a-dynamodb-table.tf
        deleted:    latest/changelog.md
        modified:   latest/outputs.tf
        modified:   latest/variables.tf

        Untracked files:
        cmds/jenkins.md


Changelog-018
        modified:   changelog.md
        modified:   cmds/linux.md
        modified:   cmds/terraform.md
        deleted:    latest/07b-s3-bucket-policy.tf
        deleted:    latest/07c-s3-bucket-&-policy.tf
        deleted:    latest/15a-backend-s3.tf

        Untracked files:        
        latest/00a-backend-s3.tf
        latest/07b-s3-bucket-&-policy.tf
        latest/07c-s3-bp-iampd.tf
        latest/07e-s3-bp-json-public.tf
        latest/07f-s3-bp-json-encrypt.tf


Changelog-019
        modified:   changelog.md
        modified:   cmds/linux.md

        Untracked files:
        installs/
        scripts/my-ec2-userdata-apache


Changelog-020
        modified:   changelog.md
        modified:   cmds/terraform.md

Changelog-021
        Changed file format on all docs in cmds dir

Changelog-022
        updated terraform cmds
        Changed file format on some docs from .md to .sh

Changelog-023
        modified:   cmds/linux.sh
        deleted:    latest/02b-ec2-jumpbox.tf
        deleted:    latest/06c-route53-record-server.tf
        deleted:    latest/06d-route53-record-jumpbox.tf

        Untracked files:
        latest/02a-ec2-jumpbox.tf
        latest/02a-ec2-server.tf
        latest/06b-route53-record-jumpbox.tf
        latest/06b-route53-record-server.tf
        latest/06h-serv-discovery-priv.tf

Changelog-024
        modified:   changelog.md
        modified:   cmds/ansible.sh
        modified:   installs/sw-installs.sh

Changelog-025
        modified:   cmds/aws/cli.sh
        modified:   cmds/aws/s3.sh
        modified:   scripts/my-ec2-userdata-apache
        modified:   changelog.md

        Untracked files:
        cmds/aws/codedeploy.sh
        cmds/monitoring.sh

Changelog-026
        restructured terraform-code library

Changelog-027
        modified:   changelog.md
        modified:   cmds/aws/codedeploy.sh
        modified:   cmds/git.sh
        modified:   cmds/linux.sh
        modified:   terraform-code/00-main/variables.tf
        modified:   terraform-code/02-ec2/02a-instances/02a-ec2-server.tf
        modified:   terraform-code/08-iam/08a-roles/08a-iamrole-ecs-te.tf

        Untracked files:
        terraform-code/02-ec2/02b-ami/02b-ami.tf

Changelog-028
        modified:   terraform-code/07-s3/07a-bucket/07a-s3-bucket-backend.tf
        deleted:    terraform-code/08-iam/08b-policy-doc/08b-iampd-state-lock.tf
        deleted:    terraform-code/09-backends/09a-s3/00a-backend-s3.tf
        modified:   terraform-code/16-dynamodb/16a-dynamodb-table.tf
        deleted:    terraform-code/99 modules/ec2/ec2.tf
        deleted:    terraform-code/99 modules/ec2/outputs.tf
        deleted:    terraform-code/99 modules/ec2/variables.tf
        deleted:    terraform-code/99 modules/myserver/myserver.tf
        deleted:    terraform-code/99 modules/myserver/outputs.tf
        deleted:    terraform-code/99 modules/myserver/variables.tf
        deleted:    terraform-code/99 modules/s3/_s3.tf

        Untracked files:
        cmds/aws/codecommit.sh
        terraform-code/02-ec2/02a-instances/02b-ec2-server.tf
        terraform-code/07-s3/07b-bucket-policy/07b-public-access-block/
        terraform-code/08-iam/08b-policy-doc/08b-iampd-statelock-logs.tf
        terraform-code/08-iam/08b-policy-doc/08b-iampd-statelock.tf
        terraform-code/09-backends/09a-s3/09a-backend-s3.tf
        terraform-code/16-dynamodb/16a-dynamodb-statelock.tf
        terraform-code/modules/

Changelog-029
        Updated iam role config

Changelog-030
        Added Cloudfromation cmds

Changelog-031
        Added XCode project
        Added CloudFormation templates

Changelog-031
        Added mobile.sh for details on mobile development. (xcode, swift, test flight etc)

Changelog-032
        Updated .gitignore and renamed some folders under code.

Changelog-033
        Updated .gitignore and renamed some codedeploy folders.

Changelog-034
        Updated the following:
        modified:   cmds/aws/cloudformation.sh
        modified:   cmds/linux.sh
        modified:   docs/known-issues.sh

        Untracked files:
        cmds/aws/route53.sh

Changelog-035
        modified:   cmds/aws/codecommit.sh
        modified:   cmds/docker.sh
        modified:   code/_scripts/installs/sw-installs.sh

        Untracked files:
        cmds/aws/SAM.sh
        cmds/aws/asg.sh
        cmds/aws/elasticbeanstalk.sh
        
Changelog-036
        merged my other cloudformation repo into this one under cloudformation folder.

Changelog-037
        added ssm cmds & cloudformation templates
        modified:   cmds/aws/asg.sh
        modified:   cmds/linux.sh

        Untracked files:
        cmds/aws/ssm.sh
        code/cloudformation/applications/app05-stepfunction-lambda-sns.yaml
        code/cloudformation/resource-stacks/107-sns/
        code/cloudformation/resource-stacks/109-lambda/

Changelog-038
        removed xcode from this repo

Changelog-039
        updated cmds/aws/asg.sh and cmds/docker.sh
