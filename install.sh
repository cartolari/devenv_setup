#!/bin/sh

set -e

install_ansible() {
  apt-get install -y software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get update
  apt-get install -y ansible
}

setup_devenv() {
  ansible-playbook -i hosts development_environment.yml
}

ansible_installed() {
  command -v ansible > /dev/null
}

install_dependencies() {
  ansible-galaxy install -f -r requirements.txt
}

if ! ansible_installed; then
  install_ansible
fi
install_dependencies
setup_devenv
