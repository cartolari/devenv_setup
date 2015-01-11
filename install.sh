#!/bin/sh

install_ansible() {
  apt-get install -qy python-dev python-pip
  pip install ansible
}

setup_devenv() {
  ansible-playbook -i hosts development_environment.yml
}

# Check if ansible is installed
command -v ansible > /dev/null

if [ $? -ne 0 ]; then
  install_ansible
fi
setup_devenv
