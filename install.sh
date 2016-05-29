#!/bin/sh

set -e

install_ansible() {
  apt-get install -y software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get update
  apt-get install -y ansible
}

setup_devenv() {
  ansible-playbook -b devenv.yml
}

ansible_installed() {
  command -v ansible > /dev/null
}

install_dependencies() {
  ansible-galaxy install -r requirements.yml
}

if ! ansible_installed; then
  install_ansible
fi
install_dependencies
setup_devenv
