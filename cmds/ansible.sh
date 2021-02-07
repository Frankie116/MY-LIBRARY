## ---------------------------------------------------------------------------------------------------
## version  1.4
## Library: https://github.com/Frankie116/my-library.git
## Ansible cmds can be found here: https://docs.ansible.com/ansible/latest/user_guide/
## ---------------------------------------------------------------------------------------------------


ansible --version


Inventory:

/etc/ansible/hosts

## ---------------------------------------------------------------------------------------------------
PATTERNS:
https://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html



ansible --list-hosts all                ## lists all devices in all groups
ansible --list-hosts "*"                ## same as above

ansible --list-hosts myservers          ## lists all devices in 'myserver' group
ansible --list-hosts my-*               ## lists all devices beginning with 'my-'

ansible --list-hosts myservers[0]       ## lists first server in 'myserver' group


## ---------------------------------------------------------------------------------------------------
ANSIBLE MODULES (also referred to as “task plugins” or “library plugins”):
https://docs.ansible.com/ansible/latest/user_guide/modules_intro.html



ansible -m ping my-server-01            ## enter 'y' to enable ping the first time this cmd used.


ansible -m ping all                     ## pings all hosts

ansible -m command -a "hostname" all    ## connects to each host in Known_hosts file and executes the command 'hostname' output is listed locally.
ansible -a "hostname" all               ## same as above

## ---------------------------------------------------------------------------------------------------

ansible-playbook playbooks/hostname.yml

cd /home/ubuntu/.ansible