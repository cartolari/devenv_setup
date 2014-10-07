#!/usr/bin/env ruby

def ansible_installed?
  system("bash -c 'command -v ansible'")
  $?.exitstatus == 0
end

system './dependencies/install_ansible.sh' unless ansible_installed?
system 'ansible-playbook -i hosts development_environment.yml'
