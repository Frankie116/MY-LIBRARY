BRANCH "master" 

Changelog-001
    created initial configs

Changelog-002
    Enabled ec2 to use public subnet in vpc.

Changelog-003
    Updated vpc, ec2 & alb code
    Added nat gateway code
    
Changelog-004
    Added rds 

Changelog-005
    modified:   100-vpc/100-vpc-22.yaml
    modified:   101-ec2/101-ec2-jumpbox.yaml
    modified:   101-ec2/101-ec2-private.yaml
    modified:   101-ec2/101-ec2-public.yaml
    modified:   102-alb/102-alb.yaml
    modified:   103-nat/103-nat.yaml
    modified:   104-rds/104-rds-mysql.yaml
    modified:   README.md

Changelog-006
    small syntax updates to following files:
    modified:   101-ec2/101-ec2-jumpbox.yaml
    modified:   101-ec2/101-ec2-private.yaml
    modified:   101-ec2/101-ec2-public.yaml
    modified:   102-alb/102-alb.yaml

Changelog-007
    Added ssm templates

Changelog-008
    Added intital configs for ecs 

Changelog-009
    Restructured folders
    Re-configured ecs-fargate configs 

Changelog-010
    Refactored all modular code 
        - moved security groups from vpc to specific template.

Changelog-011
    Refactored ecs resource stacks

Changelog-012
    created unified templates that use nested stacks
    started to refactor 200-main.yaml to use nested stacks