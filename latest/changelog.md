BRANCH "master" 
Changelog-001
Initial code generated from template: https://github.com/Frankie116/TF03-ec2-snapshot-or-amazon-ami.git
refactored lb, ec2,sg modules

Changelog-002
        modified:   02a-ec2-choose-ami.tf
        modified:   04b-sg-rules-server.tf
        modified:   04c-sg-lb.tf
        modified:   04d-sg-rules-lb.tf
        modified:   05a-lb-alb.tf
        modified:   outputs.tf
        modified:   variables.tf

        Untracked files:
        06a-route53.tf


Changelog-003
        modified:   02a-ec2-choose-ami.tf
        modified:   04b-sg-rules-server.tf
        modified:   changelog.md
        modified:   outputs.tf
        modified:   variables.tf

        Untracked files:
        02e-keypair.tf 

Changelog-004
        deleted:    02a-ec2.tf
        deleted:    02c-ami-snapshot.tf
        deleted:    02e-keypair.tf
        modified:   04b-sg-rules-server.tf
        deleted:    06b-route53.tf
        deleted:    09a-snapshot.tf
        modified:   changelog.md
        modified:   outputs.tf
        modified:   variables.tf

        Untracked files:
        02a-ec2-snapshot.tf
        02b-ec2-jumpbox.tf
        02d-ami-amazon2.tf
        02e-ami-snapshot.tf
        02g-keypair.tf
        04g-sg-jumpbox.tf
        04h-sg-rules-jumpbox.tf
        06b-route53-zone.tf
        06c-route53-record-server.tf
        06d-route53-record-jumpbox.tf
        12a-ebs-snapshot.tf

Changelog-005
        Added jumpboxes & loadbalncers... & refactored code...
        modified:   01a-vpc.tf
        modified:   02a-ec2-snapshot.tf
        modified:   02b-ec2-jumpbox.tf
        modified:   02d-ami-amazon2.tf
        modified:   02e-ami-snapshot.tf
        modified:   02g-keypair.tf
        modified:   04a-sg-server.tf
        modified:   04b-sg-rules-server.tf
        modified:   04g-sg-jumpbox.tf
        modified:   04h-sg-rules-jumpbox.tf
        deleted:    06b-route53-zone.tf
        deleted:    06c-route53-record-server.tf
        modified:   06d-route53-record-jumpbox.tf
        modified:   09b-random-string.tf
        modified:   12a-ebs-snapshot.tf
        modified:   README.md
        modified:   changelog.md
        modified:   main.tf
        modified:   outputs.tf
        modified:   provider.tf
        modified:   variables.tf

        Untracked files:
        04c-sg-lb.tf
        04d-sg-rules-lb.tf
        05a-lb-alb.tf
        05b-lb-listeners.tf
        05c-lb-tg.tf
        06a-route53-zone.tf
        06b-route53-record-lb.tf
        07a-s3-bucket.tf
