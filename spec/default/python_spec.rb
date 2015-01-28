require 'spec_helper'

describe 'devenv' do
  vars = Psych::load_file(File.expand_path('../../../roles/devenv/vars/main.yml', __FILE__))
  python_pip = vars['devenv_packages']['python_pip']

  describe command('sudo pip list') do
    python_pip.each do |pip_package|
      its(:stdout) { should include pip_package }
    end
  end

end
