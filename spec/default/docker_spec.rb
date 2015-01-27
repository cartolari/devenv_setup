require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))
  docker_version = vars['docker_version']

  describe command('docker -v') do
    its(:stdout) { should include(docker_version) }
  end

end
