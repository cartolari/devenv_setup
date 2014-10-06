#!/usr/bin/env ruby

def ansible_installed?
  system("bash -c 'command -v ansible'")
  $?.exitstatus == 0
end

system 'sudo ./dependencies/install_ansible.sh' unless ansible_installed?
system 'ansible-playbook -si hosts development_environment.yml'
