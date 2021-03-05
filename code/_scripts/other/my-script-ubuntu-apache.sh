#!/bin/bash

# --------------------------------------------------------------
# Author: Frank Effrim-Botchey
# installs Apache, Java & starts all of those services
# Can be used on an Ubuntu AMI
# --------------------------------------------------------------

sudo apt update -y   

sudo apt install apache2 -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl start apache2

sudo apt-get install default-jre -y
sudo apt-get install default-jdk
java -version

echo "<html><body><div>Welcome to the Jenkins Server (ubuntu-apache) </div></body></html>" > /var/www/html/index.html
