Important list of linux commands can be found here - https://www.howtogeek.com/412055/37-important-linux-commands-you-should-know/
## ----------------------------------------------------------------



SSH

ssh ec2-user@<host> -i <privatekkey>.pem
ssh ubuntu@<host> -i <privatekkey>.pem
ssh bitnami@<host> -i <privatekkey>.pem



EXTRACT PUBLIC KEY OUT OF PRIVATE KEY:

openssl rsa -in mykey.pem -pubout > mykey.pub
cat mykey.pub

## ----------------------------------------------------------------

CREATE SSH KEYPAIR

1.
ssh -keygen -m PEM
or
ssh-keygen -t rsa -b 4096 -f ~/.ssh/my-key

2.
mv my-key my-key.pem

3.
chmod 400 my-key.pem

4.
copy my-key.pub to aws or other location that requires public key.

## ----------------------------------------------------------------
USE SSH AGENT TO ACCESS PRIVATE EC2 VIA BASTION.  NO NEED TO COPY SSH KEY TO BASTION HOST.

1. Add the private key (PEM file) to the key chain. This allows the user to access the private instances without copying to the bastion host.

$ ssh-add -k <PEM_file_name>

2. List all keys that have neen added to the chain.  Check that your private key is added here.  

$ ssh-add -L

3. Access the Bastion Host (Public instance)

$ ssh -A ec2-user@<bastion-host-elastic-ip>


4. Access the private instance

$ ssh ec2-user@<private-instance-ip>

## ----------------------------------------------------------------
Copy single file from internet to local:


example:
curl https://raw.githubusercontent.com/torvalds/linux/master/kernel/events/core.c -o core.c

## ----------------------------------------------------------------

Issue:
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

Solution:
ssh-keygen -R <IP or HOST-ID>


# ----------------------------------------------------------------
EC2 - DISPLAY OS DETAILS:

cat /etc/os-release

## ----------------------------------------------------------------

MOUNTING EBS VOLUMES:

#! /bin/bash
sudo mkdir /data                        # create dir
sudo mkfs.ext4 ${device_name}           # create filesystem
mount ${device_name} /data

## ----------------------------------------------------------------

CHECK IF EBSBLOCK IS IN USE

df -kh

<shows filesystem info>

## ----------------------------------------------------------------

EBS VOLUMES

/sda1               # root
/dev/xvdh           # device_name

## ----------------------------------------------------------------
source: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

lsblk                           ## display all the attached drives

sudo file -s /dev/xvdb          ## display info such as file system type. (if type is shown as data
                                ## then there is no file system on the device and one must be created.)

sudo mkfs -t ext4 /dev/xvdb     ## format the volume & delete the existing data

sudo mkdir /data                ## create a data folder

sudo mount /dev/xvdb /data      ## mount the device (/dev/xvdb) onto the data folder.

lsblk                           ## should now display the xvdb device has been mounted onto the /data folder.

sudo cp /etc/fstab /etc/fstab.orig ## Automatically mount the folder on each satem reboot.

sudo nano /etc/fstab            ## add the following in nano (see link above)

/dev/xvdb   /data   ext4 defaults,nofail 0 2 

cat /etc/fstab                  ## verify file is syntactically ok

sudo file -s /dev/xvdb          ## verify that filesystem has been formatted.

lsblk

sudo umount /datasudo mount -a  ## test fstab file will mount /data

lsblk




