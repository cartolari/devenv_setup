#!/bin/sh

# Check if ansible is installed
command -v ansible

if [ $? -ne 0 ]
then
  ./dependencies/install_ansible.sh;
fi

ansible-playbook -i hosts development_environment.yml
