#!/bin/bash
sudo yum update -y
export PS1="\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@hasan:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform version