#!/bin/sh

install_ansible() {
  apt-get install -qy python-dev python-pip
  pip install ansible
}

# Check if ansible is installed
command -v ansible

if [ $? -ne 0 ]
then
  install_ansible
fi

ansible-playbook -i hosts development_environment.yml
