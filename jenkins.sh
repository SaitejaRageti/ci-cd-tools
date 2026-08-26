#!/bin/bash

#resize disk from 20GB to 50GB
growpart /dev/nvme0n1 4

lvextend -L +10G /dev/RootVG/rootVol
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

xfs_growfs /
xfs_growfs /var/tmp
xfs_growfs /var


curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-21-openjdk -y
yum install jenkins -y



sudo curl -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install fontconfig java-21-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins