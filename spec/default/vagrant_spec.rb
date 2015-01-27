require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))
  vagrant_version = vars['vagrant_version']

  describe command('vagrant -v') do
    its(:stdout) { should include(vagrant_version) }
  end

end
