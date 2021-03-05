## Terraform

download MacOS ver = terraform_0.xx.x_darwin_amd64.zip from: 
https://www.terraform.io/downloads.html


unzip & copy binary to  /usr/local/bin
mv ~/downloads/terraform /usr/local/bin


confirm installation: 
terraform -v 

## ----------------------------------------------------------------------

## Ansible
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu

## INSTALL ANSIBLE ON EC2 (UBUNTU):

$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible



## INSTALL ANSIBLE ON MACOS:
The preferred way to install Ansible on a Mac is with pip.

The instructions can be found in Installing Ansible with pip. If you are running macOS version 10.12 or older, 
then you should upgrade to the latest pip to connect to the Python Package Index securely. It should be noted that 
pip must be run as a module on macOS, and the linked pip instructions will show you how to do that.

Installing Ansible with pip
Ansible can be installed with pip, the Python package manager. If pip isn’t already available on your system of Python, run the following commands to install it:

$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ python get-pip.py --user

Note
If you have Ansible 2.9 or older installed, you need to use pip uninstall ansible first to remove older versions of Ansible before re-installing it.

Then install Ansible 1:

$ python -m pip install --user ansible
In order to use the paramiko connection plugin or modules that require paramiko, install the required module 2:

$ python -m pip install --user paramiko
If you wish to install Ansible globally, run the following commands:

$ sudo python get-pip.py
$ sudo python -m pip install ansible
## ----------------------------------------------------------------------