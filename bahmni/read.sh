#!/bin/bash

#Prerequisite for the fresh installation of Bahmni
sudo yum install -y https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm


# Install the bahmni command line program (Choose the version you want).
sudo yum install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-155.noarch.rpm

# Confirm that the bahmni command is correctly installed (you should see a help message for the command)
sudo bahmni --help

# Now setup a configuration file for bahmni command in /etc/bahmni-installer.
sudo curl -L https://tinyurl.com/yyoj98df >> /etc/bahmni-installer/setup.yml

# Confirm the contents of the file. It should look like this file: (https://goo.gl/R8ekg5)
sudo cat /etc/bahmni-installer/setup.yml

# The above setup.yml, has a timezone entry. You can change it to suit your timezone if you like. For valid options
# please read this document: https://bahmni.atlassian.net/wiki/display/BAH/List+Of+Configurable+Installation+Variables

# Set the inventory file name to local in BAHMNI_INVENTORY environment variable. This way you won't need to use the '-i local' switch every time you use the 'bahmni' command
#You can also configure custom inventory file instead of local.
sudo echo "export BAHMNI_INVENTORY=local" >> ~/.bashrc
sudo source ~/.bashrc

# Now fire the installer
sudo bahmni install -y

# The installation should be done in about 15 - 30 minutes depending on your internet speed.
# Verify installed components using the command:
sudo yum list installed | grep bahmni -y

