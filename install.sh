#!/bin/sh

install_ansible() {
  apt-get install -qy python-dev python-pip
  pip install ansible
}

setup_devenv() {
  ansible-playbook -i hosts development_environment.yml
}

ansible_installed() {
  command -v ansible > /dev/null
}

if ! ansible_installed; then
  install_ansible
fi
setup_devenv
